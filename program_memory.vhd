----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 11:52:24
-- Design Name: 
-- Module Name: program_memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_memory is
    Port ( clk : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (10 downto 0);
           dout : out STD_LOGIC_VECTOR (13 downto 0));
end program_memory;

architecture Behavioral of program_memory is

    type program_memory_type is array (0 to 2047) of STD_LOGIC_VECTOR(13 downto 0);
    
    signal mem_contents : program_memory_type := (
        0 => B"00_1010_0111_1111", 
        1 => B"00_1010_1111_1111", 
        2 => B"00_0011_0111_1111", 
        3 => B"00_0011_1111_1111", 
        4 => B"00_1010_0111_1111", 
        5 => B"00_1010_1111_1111",
        6 => B"00_0011_0111_1111", 
        7 => B"00_0011_1111_1111", 
        8 => B"00_0011_0111_1111", 
        9 => B"00_0011_1111_1111", 
        others => B"00_0000_0000_0000");

begin

    process(clk)
    begin
        if rising_edge(clk) then
            dout <= mem_contents(to_integer(unsigned(addr_in)));
        end if;
    end process;

end Behavioral;
