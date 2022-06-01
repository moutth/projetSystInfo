----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 10:48:48
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           ctrl_ALU : in STD_LOGIC_VECTOR (2 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC);
end alu;

architecture Behavioral of alu is

signal Aux: STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal A_16: STD_LOGIC_VECTOR (15 downto 0);
signal B_16: STD_LOGIC_VECTOR (15 downto 0);

--Des variables temporaires contenant la valeur des flags 
signal N_1:STD_LOGIC;
signal O_1:STD_LOGIC;
signal Z_1:STD_LOGIC;
signal C_1:STD_LOGIC;

begin

--Initialisation sur 16 bits 
    A_16 <= X"00" & A;
    B_16 <= X"00" & B;

--Choix de l'instruction qui va etre réalisée
    Aux <= A_16 + B_16 when ctrl_ALU = "001" else
           A_16 - B_16 when ctrl_ALU = "011" else
           x"9999" when ctrl_ALU = "000" or ctrl_ALU = "111"  else 
           A * B when ctrl_ALU = "010";
           

           
--Définition des differents Flags   
    C <= Aux(8) when ctrl_ALU = "001" else
        '0';
        
    N <= '1' when Aux(7) = '1' and ctrl_ALU = "011" else 
         '0';
         
    O <= '1' when ctrl_ALU = "010" and Aux(15 downto 8) > 0 else
         '0';
         
    Z <= '1' when Aux = 0 else 
         '0';
         
-- Ajout de la valeur das la solution finale
             S <= Aux (7 downto 0); 
    
end Behavioral;
