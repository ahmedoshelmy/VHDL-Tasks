Library ieee;
Use ieee.std_logic_1164.all;
ENTITY C IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
CIN: IN std_logic ;
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END C;

ARCHITECTURE ArchC OF C IS
BEGIN

F <= A_IN (6 DOWNTO 0) & '0' WHEN S = "00"
ELSE A_IN (6 DOWNTO 0) & A_IN(7) WHEN S = "01"
ELSE A_IN (6 DOWNTO 0) & CIN WHEN S = "10"
ELSE "00000000";

COUT <= A_IN(7) WHEN S = "00"
ELSE A_IN(7) WHEN S = "01" 
ELSE A_IN(7) WHEN S = "10"
ELSE '0';

END ArchC;
