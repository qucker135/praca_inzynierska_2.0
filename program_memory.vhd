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
        -- STATUS TEST
        0 => B"00_0001_1000_0011", -- CLRF
        1 => B"00_1010_1000_0011", -- INCF
        2 => B"00_0001_1000_0011", -- CLRF

        -- INDIRECT ADDRESSING TEST
        3 => B"11_0000_0010_0000", -- MOVLW
        4 => B"00_0000_1100_0000", -- MOVWF
        5 => B"11_0001_0100_0000", -- MOVLW
        6 => B"00_0000_1000_0100", -- MOVWF
        7 => B"11_0011_0011_0000", -- MOVLW
        8 => B"00_0000_1000_0000", -- MOVWF

        -- PCLATH & PC TEST
        9 => B"11_0010_0000_1000", -- MOVLW
       10 => B"00_0111_1000_1010", -- ADDWF
       11 => B"10_1000_0000_1100", -- GOTO
       12 => B"00_0101_1000_1010", -- ANDWF
       13 => B"10_0000_0000_1111", -- CALL
       14 => B"10_1111_1111_1000", -- GOTO
       15 => B"00_0000_0000_1000", -- RETURN

        others => B"00_0000_0000_0000");

begin

    process(clk)
    begin
        if rising_edge(clk) then
            dout <= mem_contents(to_integer(unsigned(addr_in)));
        end if;
    end process;

end Behavioral;
