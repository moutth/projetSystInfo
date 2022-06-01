----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2022 10:02:37
-- Design Name: 
-- Module Name: Processeur - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processeur is
end Processeur;

architecture Behavioral of Processeur is

-- Here we are adding all the components needed

-- ALU
COMPONENT ALU 
    Port(A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         S : out STD_LOGIC_VECTOR (7 downto 0);
         ctrl_ALU : in STD_LOGIC_VECTOR (2 downto 0);
         N : out STD_LOGIC;
         O : out STD_LOGIC;
         Z : out STD_LOGIC;
         C : out STD_LOGIC);
END COMPONENT;

-- Banc de registre 
COMPONENT BR 
    Port(adr_A : in STD_LOGIC_VECTOR (3 downto 0);
         adr_B : in STD_LOGIC_VECTOR (3 downto 0);
         adr_W : in STD_LOGIC_VECTOR (3 downto 0);
         W : in STD_LOGIC;
         DATA : in STD_LOGIC_VECTOR (7 downto 0);
         RST : in STD_LOGIC;
         CLK : in STD_LOGIC;
         QA : out STD_LOGIC_VECTOR (7 downto 0);
         QB : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--Memoire de données
COMPONENT BM_D
    Port(ADR : in STD_LOGIC_VECTOR (7 downto 0);
         Insert : in STD_LOGIC_VECTOR (7 downto 0);
         RW : in STD_LOGIC;
         RST : in STD_LOGIC;
         CLK : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

--Memoire des instruction 
COMPONENT BM_I 
    Port(ADR : in STD_LOGIC_VECTOR (7 downto 0);
         CLK : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

--Gestionnaire des alea 
COMPONENT GEST_ALEA 
    Port ( COMPTEUR : in integer;
           OP_1 : in STD_LOGIC_VECTOR (7 downto 0);
           OP_2 : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_IN : in STD_LOGIC;
           CLK_IN2 : in time;
           CLK_OUT : out STD_LOGIC);
END COMPONENT;

-- We are adding the signals that are going to be used through this Processor

--Memoire des instructions 
signal ADR_INSTRUCTION : STD_LOGIC_VECTOR (7 downto 0):=x"00";
signal INSTRUCTION : STD_LOGIC_VECTOR(31 DOWNTO 0):= x"10001000";

--Banc de registre 
signal R_QA, R_QB : STD_LOGIC_VECTOR (7 downto 0);

--ALU elements 
signal ALU_N, ALU_O, ALU_Z, ALU_C : STD_LOGIC;
signal ALU_S : STD_LOGIC_VECTOR (7 downto 0);
	
-- Output Banc de Memoire côté données 
signal DATA_BM : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- MUX
signal MUX_LIDI_DIEX: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal MUX_DIEX_EXMEM: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal MUX_EXMEM_MEMRE_1: STD_LOGIC_VECTOR(7 DOWNTO 0);
signal MUX_EXMEM_MEMRE_2: STD_LOGIC_VECTOR(7 DOWNTO 0);

-- LC
signal LC_DIEX_EXMEM: STD_LOGIC_VECTOR(2 DOWNTO 0);
signal LC_EXMEM_MEMRE: STD_LOGIC;
signal LC_MEMRE_OUT: STD_LOGIC;

--les différents éléments composant notre pipeline. 

-- LI/DI
signal LI_DI_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal LI_DI_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal LI_DI_C : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal LI_DI_OP : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- DI/EX
signal DI_EX_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal DI_EX_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal DI_EX_C : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal DI_EX_OP : STD_LOGIC_VECTOR(7 DOWNTO 0);

--EX/Mem
signal EX_Mem_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal EX_Mem_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal EX_Mem_OP : STD_LOGIC_VECTOR(7 DOWNTO 0);

--Mem/RE
signal Mem_RE_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal Mem_RE_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal Mem_RE_OP : STD_LOGIC_VECTOR(7 DOWNTO 0);

-- Clock period definition
constant Clock_period: time := 100 ns;

--Les élements du Proc qui vont être utilisés
signal CLK_PROC : STD_LOGIC := '1'; 
signal RST_PROC : STD_LOGIC := '1';

--la clock réalisée par le gestionnaire des aleas 
signal CLK_ALEA : STD_LOGIC := '0';
signal compt : integer := 0;

begin

    --Clock process definition 
    Clock_process : process 
    
    begin 
        wait for Clock_period/2;
        CLK_PROC <= not(CLK_PROC);
        
    end process;
    
	--Connexion des différents élements du processeur avec la mémoire des données 
	INST_MEMO : BM_I PORT MAP (
        ADR => ADR_INSTRUCTION,
        CLK => CLK_PROC,
        Output => INSTRUCTION
    ); 	
    
    --Création de l'instance correspondant au banc de registre
    Banc : BR PORT MAP (
        adr_A => LI_DI_B(3 DOWNTO 0),
        adr_B => LI_DI_C(3 DOWNTO 0),
        adr_W => Mem_RE_A(3 DOWNTO 0),
        W => LC_MEMRE_OUT,
        DATA => Mem_RE_B,
        RST => RST_PROC,
        CLK => CLK_PROC,
        QA => R_QA,
        QB => R_QB
    );
    
    --Création de l'instance de l'ALU
    ALU_Map : ALU PORT MAP (
        A => DI_EX_B,
        B => DI_EX_C,
        CTRL_ALU => LC_DIEX_EXMEM,
        N => ALU_N,
        O => ALU_O,
        Z => ALU_Z,
        C => ALU_C,
        S => ALU_S
    );
    
    --Création de l'instance de mémoire de donnée
    Memoire : BM_D PORT MAP (
        ADR => MUX_EXMEM_MEMRE_1 ,
        Insert => EX_Mem_B ,
        RW => LC_EXMEM_MEMRE ,
        RST => RST_PROC,
        CLK => CLK_PROC,
        OUTPUT => DATA_BM 
    );
            
    --Création du gestionnaire des aleas
    Alea : GEST_ALEA PORT MAP (
        COMPTEUR => compt,
        OP_1 => LI_DI_OP,
        OP_2 => DI_EX_OP,
        CLK_IN => CLK_PROC,
        CLK_IN2 => Clock_period,
        CLK_OUT => CLK_ALEA
    );
          
--------------------------------------------------------------------------------------------------------------    
    
    process
    begin 
        wait until rising_edge(CLK_PROC);
        
        --Définition des différentes variables du pipeline LI/DI
        LI_DI_A <= INSTRUCTION(23 downto 16);
        LI_DI_OP <= INSTRUCTION(31 downto 24);
        LI_DI_B <= INSTRUCTION(15 downto 8);
        LI_DI_C <= INSTRUCTION(7 downto 0);
            
    end process;
        
    process 
    begin 
        wait until rising_edge(CLK_PROC);
                
        --Définition des différentes variables du pipeline DI/EX
        DI_EX_A <= LI_DI_A;
        DI_EX_OP <= LI_DI_OP;
        DI_EX_B <= MUX_LIDI_DIEX;
        DI_EX_C <= R_QB;       
        
    end process;
    
    process 
    begin 
        wait until rising_edge(CLK_PROC);
                
        --Définition des différentes variables du pipeline EX/Mem
        EX_Mem_A <= DI_EX_A;
        EX_Mem_OP <= DI_EX_OP;
        EX_Mem_B <= MUX_DIEX_EXMEM;
        
    end process;
    
    process 
    begin 
        wait until rising_edge(CLK_PROC);
        
        --Définition des différentes variables du pipeline Mem/RE
        Mem_RE_A <= EX_Mem_A;
        Mem_RE_OP <= EX_Mem_OP;
        Mem_RE_B <= MUX_EXMEM_MEMRE_2;
         
    end process;
    
---------------------------------------------------------------------------------------------------------------

    --définition des différents choix faits pour LC --------------------------------------------------------------------------------------------------
    
    --Ecriture dans le banc de registre
    LC_MEMRE_OUT <= '1' when Mem_RE_OP = x"06" or Mem_RE_OP = x"05" or Mem_RE_OP = x"01" or Mem_RE_OP = x"02" or Mem_RE_OP = x"03" or Mem_RE_OP = x"07" else '0' ;    
    --Affectation des différentes instruction pour faire les calculs dans l'ALU
    LC_DIEX_EXMEM <= DI_EX_OP(2 downto 0);  
    --Modifications pour le banc de mémoire 
    LC_EXMEM_MEMRE <= '0' when EX_Mem_OP = x"08" else '1';
    
--------------------------------------------------------------------------------------------------------------       
 
    --définition des différents choix faits pour MUX -------------------------------------------------------------------------------------------------
    MUX_LIDI_DIEX <= LI_DI_B when LI_DI_OP = x"06" or LI_DI_OP = x"07" else R_QA;
    
    MUX_DIEX_EXMEM <= ALU_S when DI_EX_OP = x"01" or DI_EX_OP = x"02" or DI_EX_OP = x"03" else DI_EX_B;
    
    MUX_EXMEM_MEMRE_1 <= EX_Mem_A when EX_Mem_OP = x"08" else EX_Mem_B;
     	
	MUX_EXMEM_MEMRE_2 <= DATA_BM when EX_Mem_OP = x"07" else EX_Mem_B;
	
-------------------------------------------------------------------------------------------------------------- 
       
--Modification de l'instruction qui va être utilisée 
process(CLK_ALEA)
begin 
    if(rising_edge(CLK_ALEA)) then  
        ADR_INSTRUCTION <= ADR_INSTRUCTION + x"01";
    end if;
end process;

                       
--Ici nous avons le compteur permettant d'attendre trois tic d'horloge avant de charger une instruction 

process(CLK_PROC,CLK_ALEA)
begin 
    if(rising_edge(CLK_PROC) and compt < 3 and INSTRUCTION /= "UUUUUUUU" and LI_DI_OP /= x"07") then 
        compt <= compt + 1;
    elsif(LI_DI_OP = x"07" and rising_edge(CLK_ALEA)) then 
        compt <= 0 after Clock_period/2, 1 after (3*Clock_period)/2 ;
    elsif(compt = 3 and rising_edge(CLK_PROC)) then
        compt <= 0;      
    end if;
end process;

                                    
end Behavioral;
