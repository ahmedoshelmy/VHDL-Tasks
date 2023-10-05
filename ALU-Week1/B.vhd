Library ieee;
Use ieee.std_logic_1164.all;
ENTITY B IS
PORT( 
A_IN, B_IN: IN std_logic_vector  (7 DOWNTO 0);
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END B;

ARCHITECTURE ArchB OF B IS
BEGIN
COUT<='0';
F <= A_IN OR B_IN WHEN S = "00"
ELSE A_IN AND B_IN WHEN S = "01"
ELSE A_IN NOR B_IN WHEN S = "10"
ELSE NOT A_IN;

END ArchB;