----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 14:04:29
-- Design Name: 
-- Module Name: slice_addr_mux - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity slice_addr_mux is
    Port ( status_in : in STD_LOGIC_VECTOR (7 downto 0);
           ir_in : in STD_LOGIC_VECTOR (13 downto 0);
           fsr_in : in STD_LOGIC_VECTOR (7 downto 0);
           indirect_out : out STD_LOGIC_VECTOR (8 downto 0);
           direct_out : out STD_LOGIC_VECTOR (8 downto 0));
end slice_addr_mux;

architecture Behavioral of slice_addr_mux is

begin

    indirect_out <= status_in(7) & fsr_in;

    direct_out <= status_in(6 downto 5) & ir_in(6 downto 0);

end Behavioral;
