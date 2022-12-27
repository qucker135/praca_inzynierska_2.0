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
        0 => B"00_1010_1111_1111", -- INCF
        1 => B"10_0000_1100_0000", -- CALL
        2 => B"10_0001_0000_0000", -- CALL
        3 => B"00_1000_0000_1011", -- MOVF
        4 => B"00_0001_1000_1011", -- CLRF
        5 => B"11_0000_0000_0000", -- MOVLW
        6 => B"10_0001_1000_0000", -- CALL
        7 => B"11_0000_0000_0000", -- MOVLW
        8 => B"10_1000_0000_0000", -- GOTO

      192 => B"00_0011_1111_1111", -- DECF
      193 => B"00_1111_1111_1111", -- INCFSZ
      194 => B"11_0000_0101_0101", -- MOVLW
      195 => B"00_0000_0000_1000", -- RETURN

      256 => B"00_0011_1111_1111", -- DECF
      257 => B"00_1111_1111_1111", -- INCFSZ
      258 => B"11_0000_0101_0111", -- MOVLW
      259 => B"00_0000_0000_1001", -- RETFIE

      384 => B"00_0011_1111_1111", -- DECF
      385 => B"00_1111_1111_1111", -- INCFSZ
      386 => B"11_0000_1101_1111", -- MOVLW
      387 => B"11_0100_0110_1001", -- RETLW
        others => B"00_0000_0000_0000");

begin

    process(clk)
    begin
        if rising_edge(clk) then
            dout <= mem_contents(to_integer(unsigned(addr_in)));
        end if;
    end process;

end Behavioral;
