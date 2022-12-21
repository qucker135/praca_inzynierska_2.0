----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 13:25:21
-- Design Name: 
-- Module Name: mux_9 - Behavioral
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

entity mux_9 is
    Port ( d0 : in STD_LOGIC_VECTOR (8 downto 0);
           d1 : in STD_LOGIC_VECTOR (8 downto 0);
           s : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (8 downto 0));
end mux_9;

architecture Behavioral of mux_9 is

begin

    dout <= d0 when s = '0' else d1;

end Behavioral;
