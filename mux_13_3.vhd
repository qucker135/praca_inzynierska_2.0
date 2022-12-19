----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 13:25:16
-- Design Name: 
-- Module Name: mux_13_3 - Behavioral
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

use work.mux_13_3_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_13_3 is
    Port ( mux_in_vec : in mux_13_3_input_type;
           str : in STD_LOGIC_VECTOR (2 downto 0);
           mux_out : out STD_LOGIC_VECTOR (12 downto 0));
end mux_13_3;

architecture Behavioral of mux_13_3 is

begin

    process(mux_in_vec, str)
    begin
        case str is
            when "000" =>
                mux_out <= mux_in_vec(0);
            when "001" =>
                mux_out <= mux_in_vec(1);
            when "010" =>
                mux_out <= mux_in_vec(2);
            when "011" =>
                mux_out <= mux_in_vec(3);
            when "100" =>
                mux_out <= mux_in_vec(4);
            when "101" =>
                mux_out <= mux_in_vec(5);
            when "110" =>
                mux_out <= mux_in_vec(6);
            when "111" =>
                mux_out <= mux_in_vec(7);
            when others =>
                mux_out <= mux_in_vec(7);
        end case;
    end process;

end Behavioral;
