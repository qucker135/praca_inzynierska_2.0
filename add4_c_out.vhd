----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2022 11:18:39
-- Design Name: 
-- Module Name: add4_c_out - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add4_c_out is
    Port ( arg1 : in STD_LOGIC_VECTOR (3 downto 0);
           arg2 : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (3 downto 0);
           c_out : out STD_LOGIC);
end add4_c_out;

architecture Behavioral of add4_c_out is

signal EXT_ARG1 : STD_LOGIC_VECTOR(4 downto 0);
signal EXT_ARG2 : STD_LOGIC_VECTOR(4 downto 0);

signal SUM : STD_LOGIC_VECTOR(4 downto 0);

begin

    EXT_ARG1 <= '0' & ARG1;
    EXT_ARG2 <= '0' & ARG2;
    
    SUM <= STD_LOGIC_VECTOR(unsigned(EXT_ARG1) + unsigned(EXT_ARG2));
    
    res <= SUM(3 downto 0);
    c_out <= SUM(4);

end Behavioral;
