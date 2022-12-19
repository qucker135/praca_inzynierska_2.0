----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2022 19:49:32
-- Design Name: 
-- Module Name: intcon_input_logic - Behavioral
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

entity intcon_input_logic is
    Port ( gie_set : in STD_LOGIC;
           gwe : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           cur_intcon : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end intcon_input_logic;

architecture Behavioral of intcon_input_logic is

begin

    process(
        gie_set,
        gwe,
        din,
        cur_intcon
    )
    begin
        if gie_set = '1' then
            dout(7) <= '1';
        elsif gwe = '1' then
            dout(7) <= din(7);
        else
            dout(7) <= cur_intcon(7);
        end if;
    end process;

    process(
        gwe,
        din,
        cur_intcon
    )
    begin
        if gwe = '1' then
            dout(6 downto 0) <= din(6 downto 0);
        else
            dout(6 downto 0) <= cur_intcon(6 downto 0);
        end if;
    end process;


end Behavioral;
