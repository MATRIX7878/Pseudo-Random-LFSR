LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD_UNSIGNED.ALL;

ENTITY lfsr IS
    GENERIC(SEED : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00001";
            TAPS : STD_LOGIC_VECTOR (4 DOWNTO 0) := x"1B";
            BITS : INTEGER := 5
            );
    PORT(clk : IN STD_LOGIC;
          randomBit : OUT STD_LOGIC
         );
END ENTITY;

ARCHITECTURE BEHAVIOR OF lfsr IS

SIGNAL sr : STD_LOGIC_VECTOR (BITS - 1 DOWNTO 0) := SEED;
SIGNAL final : STD_LOGIC;

BEGIN

    LF : FOR i IN 0 TO BITS - 1 GENERATE
        SIGNAL feedback : STD_LOGIC;
        IF i = 0 THEN
            feedback <= sr(i) AND TAPS(i);
        ELSE
            feedback <= <<SIGNAL.LF(i-1).feedback:STD_LOGIC>> XOR (sr(i) AND TAPS(i));
        END IF;
    END GENERATE;

    PROCESS(ALL)
    BEGIN
        IF RISING_EDGE(clk) THEN
            sr <= sr(BITS - 2 DOWNTO 0) & final;
            randomBit <= sr(BITS - 1);
            final <= <<SIGNAL.LF(BITS-1).feedback:STD_LOGIC>>;
        END IF;
    END PROCESS;
END ARCHITECTURE;