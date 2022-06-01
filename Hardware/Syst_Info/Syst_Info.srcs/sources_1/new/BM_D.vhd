----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2022 10:38:29
-- Design Name: 
-- Module Name: BM_D - Behavioral
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
USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BM_D is
    Port ( ADR : in STD_LOGIC_VECTOR (7 downto 0);
           Insert : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end BM_D;

architecture Behavioral of BM_D is

type Memoire is array(255 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal zone:Memoire;

begin

    process
    begin
    
        wait until rising_edge(CLK);
        
        --Choix si l'on reset ou non la mémoire considérée 
        if ( RST = '0') then 
            --Réinitialisation des differents champs de la mémoire
            for I in 0 to 15 loop
                    zone(I) <= X"00";
            end loop;
                
        else 
            --Choix si l'on effectue une écriture ou une lecture.
            if (RW = '1') then 
                --Lecture de la valeur en mémoire sur l'output
                Output <= zone(to_integer(unsigned(ADR)));
            else
                --Ecriture de la valeur de l'input en mémoire 
                zone(to_integer(unsigned(ADR))) <= Insert ;
            end if;
            
        end if;
    
end process;

end Behavioral;
