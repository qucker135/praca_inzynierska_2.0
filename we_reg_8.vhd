----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2022 15:15:25
-- Design Name: 
-- Module Name: we_reg_8 - Behavioral
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

entity we_reg_8 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end we_reg_8;

architecture Behavioral of we_reg_8 is

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                dout <= din;
            end if;
        end if;
    end process;

end Behavioral;
