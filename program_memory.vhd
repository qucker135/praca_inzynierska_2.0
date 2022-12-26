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
        0 => B"00_1010_0111_1111", -- INCF
        1 => B"11_1110_1111_1111", -- ADDLW
        2 => B"11_1100_0001_0000", -- SUBLW
        3 => B"11_1000_0000_0101", -- IORLW
        4 => B"11_1001_0100_1111", -- ANDLW
        5 => B"11_1001_0000_0000", -- ANDLW
        6 => B"11_0000_1010_0101", -- MOVLW
        7 => B"11_1010_1100_0011", -- XORLW
        8 => B"11_1010_0110_0110", -- XORLW
        9 => B"11_0000_0110_0110", -- MOVLW
       10 => B"00_0000_1111_1111", -- MOVWF
       11 => B"01_0001_0111_1111", -- BCF
       12 => B"01_0100_0111_1111", -- BSF
       13 => B"01_1011_1111_1111", -- BTFSC
       14 => B"00_0000_1111_1111", -- MOVWF
       15 => B"01_1111_1111_1111", -- BTFSS
       16 => B"00_0000_1111_1111", -- MOVWF
       17 => B"11_0000_1001_1010", -- MOVLW
       18 => B"01_1111_0111_1111", -- BTFSS
       19 => B"00_0000_1111_1111", -- MOVWF
       20 => B"01_1011_0111_1111", -- BTFSC
       21 => B"00_0000_1111_1111", -- MOVWF
       22 => B"00_0001_0001_1110", -- CLRW
       23 => B"00_0001_1111_1111", -- CLRF
        others => B"00_0000_0000_0000");

begin

    process(clk)
    begin
        if rising_edge(clk) then
            dout <= mem_contents(to_integer(unsigned(addr_in)));
        end if;
    end process;

end Behavioral;
