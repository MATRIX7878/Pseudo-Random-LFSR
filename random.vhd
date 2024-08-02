LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY random IS
    PORT(clk : IN STD_LOGIC;
         number : OUT STD_LOGIC
         );
END ENTITY;

ARCHITECTURE behavior OF random IS

SIGNAL seed : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00001";

BEGIN

    PROCESS(clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
            seed <= seed(3 DOWNTO 0) & (seed(4) XOR seed(1));
            number <= seed(4);
        END IF;
    END PROCESS;
END ARCHITECTURE;