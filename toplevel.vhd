LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD_UNSIGNED.ALL;

ENTITY toplevel IS
    PORT(clk : IN STD_LOGIC;
         randomBit : OUT STD_LOGIC
         );
END ENTITY;

ARCHITECTURE Behavior OF toplevel IS

SIGNAL counter : STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '0');
SIGNAL value : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL buff : STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');

COMPONENT random IS
    PORT(clk : IN STD_LOGIC;
         number : OUT STD_LOGIC
         );
END COMPONENT;

BEGIN
    pseudo : random PORT MAP (clk => clk, number => randomBit);

    PROCESS(clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
            IF counter = 4 THEN
                value <= buff;
            END IF;

            counter <= counter + '1';
            buff <= buff(1 DOWNTO 0) & randomBit;
        END IF;
    END PROCESS;
END ARCHITECTURE;