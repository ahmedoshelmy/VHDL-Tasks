Library ieee;
Use ieee.std_logic_1164.all;

ENTITY D IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
CIN: IN std_logic ;
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END D;

ARCHITECTURE ArchD OF D IS
BEGIN

F <= '0' & A_IN (7 DOWNTO 1)   WHEN S = "00"
ELSE A_IN(0) & A_IN (7 DOWNTO 1) WHEN S = "01"
ELSE CIN & A_IN (7 DOWNTO 1)  WHEN S = "10"
ELSE A_IN(7) & A_IN (7 DOWNTO 1);

COUT <= A_IN(0) ;

END ArchD;
