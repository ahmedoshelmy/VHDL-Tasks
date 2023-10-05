Library ieee;
Use ieee.std_logic_1164.all;
ENTITY ALU IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
B_IN : IN std_logic_vector  (7 DOWNTO 0);
CIN: IN std_logic ;
S: IN std_logic_vector  (3 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic
);
END ALU;

ARCHITECTURE ArchALU OF ALU IS

COMPONENT B IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
B_IN : IN std_logic_vector  (7 DOWNTO 0);
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END COMPONENT ;



COMPONENT C IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
CIN: IN std_logic ;
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END COMPONENT ;

COMPONENT D IS
PORT( 
A_IN: IN std_logic_vector  (7 DOWNTO 0);
CIN: IN std_logic ;
S: IN std_logic_vector  (1 DOWNTO 0);
F: OUT std_logic_vector  (7 DOWNTO 0);
COUT: OUT std_logic 
);
END COMPONENT ;

 SIGNAL FB,FC,FD    : std_logic_vector(7 DOWNTO 0);
 SIGNAL COUTB,COUTC,COUTD    : std_logic;


BEGIN

 u0: B PORT MAP (A_IN, B_IN, S(1 DOWNTO 0), FB, COUTB); 
 u1: C PORT MAP (A_IN, CIN, S(1 DOWNTO 0), FC, COUTC);
 u2: D PORT MAP (A_IN, CIN, S(1 DOWNTO 0), FD, COUTD);


 F <= FB WHEN S(3 DOWNTO 2) = "01"
 ELSE FC WHEN S(3 DOWNTO 2) = "10"
 ELSE FD WHEN S(3 DOWNTO 2) = "11";


 COUT <= COUTB WHEN S(3 DOWNTO 2) = "01"
 ELSE COUTC WHEN S(3 DOWNTO 2) = "10"
 ELSE COUTD WHEN S(3 DOWNTO 2) = "11";


END ArchALU;