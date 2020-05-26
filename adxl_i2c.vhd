

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adxl_i2c IS
    PORT (
		  START : IN STD_LOGIC;
        I2C_FIFO_FULL : IN STD_LOGIC;
        I2C_FIFO_EMPTY : IN STD_LOGIC;
        I2C_Busy : IN STD_LOGIC;
        Reset : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        I2C_GO : OUT STD_LOGIC;
        I2C_Address : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        I2C_Read_Cnt : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        I2C_FIFO_PUSH : OUT STD_LOGIC;
        I2C_FIFO_POP : OUT STD_LOGIC;
        I2C_FIFO_DI : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        I2C_FIFO_DO : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		  LED_OUT : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		  );
END adxl_i2c;

ARCHITECTURE Behavioral OF adxl_i2c IS

    TYPE state_type IS (sStartWait,sReset,
        sGo1, sPushRegister, sWait1, -- config
        sWaitWrite, sGo2, sWait2-- iteration: write data byte
    );
    SIGNAL state, next_state : state_type;
BEGIN
    process1 : PROCESS (Clk)
    BEGIN
        IF rising_edge(Clk) THEN
            IF Reset = '1' THEN
                state <= sReset;
            ELSE
                state <= next_state;
            END IF;
        END IF;
    END PROCESS process1;

    process2 : PROCESS (state, I2C_Busy, I2C_FIFO_FULL, I2C_FIFO_EMPTY, Reset)
    BEGIN
        next_state <= state; -- by default
        CASE state IS
				WHEN sStartWait =>
					IF Start = '1' THEN
					next_state <=  sGo1;
					END IF;
					
            WHEN sReset =>
                next_state <= sStartWait;
            WHEN sGo1 =>
                next_state <= sPushRegister;
            WHEN sPushRegister =>
                next_state <= sWait1;
            
            WHEN sWait1 =>
                IF I2C_Busy = '0' THEN
                    next_state <= sGo2;
                ELSIF I2C_Busy = '1' THEN
                    next_state <= sWait1;
                END IF;
            WHEN sGo2 =>
                next_state <= sWait2;
            WHEN sWait2 =>
                IF I2C_Busy = '0' THEN
                    next_state <= sStartWait;
                ELSIF I2C_Busy = '1' THEN
                    next_state <= sWait2;
                END IF;
					 
				when others =>
					next_state <= sReset;
        END CASE;
    END PROCESS process2;
	 
	 

    I2C_Address <= X"3B" WHEN state = sGo2 ELSE
        X"3A";
    I2C_Read_Cnt <= "0001";

    I2C_FIFO_PUSH <= '1' WHEN (state = sPushRegister)
        AND I2C_FIFO_FULL = '0' ELSE '0';

    I2C_FIFO_DI <=
        X"00" WHEN state = sPushRegister ELSE
        X"00";

	 LED_OUT <= 
	 I2C_FIFO_DO WHEN state = sWait2 ELSE
		X"00";
	  
    I2C_Go <= '1' WHEN state = sGo1 OR state = sGo2 ELSE
        '0';
END Behavioral;