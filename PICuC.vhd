----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2022 17:55:33
-- Design Name: 
-- Module Name: PICuC - Behavioral
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

entity PICuC is
    Port ( clk : in STD_LOGIC;
           stack_out : out STD_LOGIC_VECTOR(12 downto 0);
           reg_file_addr_in : out STD_LOGIC_VECTOR(8 downto 0);
           reg_file_data_out : out STD_LOGIC_VECTOR(7 downto 0);
           pm_out : out STD_LOGIC_VECTOR (13 downto 0);
           ir_out : out STD_LOGIC_VECTOR(13 downto 0);
           datamux_out : out STD_LOGIC_VECTOR(7 downto 0);
           wreg_in : out STD_LOGIC_VECTOR(7 downto 0);
           wreg_out : out STD_LOGIC_VECTOR(7 downto 0);
           we_status_flags : out STD_LOGIC_VECTOR(2 downto 0);
           status_out : out STD_LOGIC_VECTOR(7 downto 0);
           pc_out : out STD_LOGIC_VECTOR(12 downto 0);
           alu_op : out STD_LOGIC_VECTOR(4 downto 0);
           alu_res : out STD_LOGIC_VECTOR(7 downto 0);
           alu_flags : out STD_LOGIC_VECTOR(2 downto 0);
           status_flags : out STD_LOGIC_VECTOR(2 downto 0);
           fsr_out : out STD_LOGIC_VECTOR(7 downto 0);
           we_ir : out STD_LOGIC;
           we_reg_file : out STD_LOGIC;
           we_wreg : out STD_LOGIC;
           addrmux_s : out STD_LOGIC;
           datamux_s : out STD_LOGIC;
           str_inc_pc : out STD_LOGIC;
           we_flags_caching_reg : out STD_LOGIC;
           ir_rest : out STD_LOGIC;
           stack_enable : out STD_LOGIC;
           stack_push_pop : out STD_LOGIC;
           str_k_to_pc : out STD_LOGIC;
           str_pc_from_stack : out STD_LOGIC;
           gie_set : out STD_LOGIC;
           pre_wreg_mux_retlw_s : out STD_LOGIC
           );
end PICuC;

architecture Behavioral of PICuC is

    component slice_addr_mux is
        Port ( status_in : in STD_LOGIC_VECTOR (7 downto 0);
               ir_in : in STD_LOGIC_VECTOR (13 downto 0);
               fsr_in : in STD_LOGIC_VECTOR (7 downto 0);
               indirect_out : out STD_LOGIC_VECTOR (8 downto 0);
               direct_out : out STD_LOGIC_VECTOR (8 downto 0));
    end component;

    component stack is
        Port ( clk : in STD_LOGIC;
               ena : in STD_LOGIC;
               push_pop : in STD_LOGIC;
               stack_in : in STD_LOGIC_VECTOR (12 downto 0);
               stack_out : out STD_LOGIC_VECTOR (12 downto 0));
    end component;

    component we_reg_3 is
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               din : in STD_LOGIC_VECTOR (2 downto 0);
               dout : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component mux_9 is
        Port ( d0 : in STD_LOGIC_VECTOR (8 downto 0);
               d1 : in STD_LOGIC_VECTOR (8 downto 0);
               s : in STD_LOGIC;
               dout : out STD_LOGIC_VECTOR (8 downto 0));
    end component;

    component slice_datamux_ir is
        Port ( ir_in : in STD_LOGIC_VECTOR (13 downto 0);
               ir_8_out : out STD_LOGIC_VECTOR (7 downto 0);
               ir_11_out : out STD_LOGIC_VECTOR (10 downto 0));
    end component;

    component register_file is
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               addr_in : in STD_LOGIC_VECTOR (8 downto 0);
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out STD_LOGIC_VECTOR (7 downto 0);
               value_from_stack : in STD_LOGIC_VECTOR(12 downto 0);
               str_from_stack : in STD_LOGIC;
               value_k_to_pc : in STD_LOGIC_VECTOR(10 downto 0);
               str_k_to_pc : in STD_LOGIC;
               str_inc_pc : in STD_LOGIC;
               gie_set : in STD_LOGIC;
               status_flags : in STD_LOGIC_VECTOR(2 downto 0);
               we_status_flags : in STD_LOGIC_VECTOR(2 downto 0);
               pc_out : out STD_LOGIC_VECTOR(12 downto 0);
               fsr_out: out STD_LOGIC_VECTOR(7 downto 0);
               status_out : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
 
    component slice_pc is
        Port ( pc_in : in STD_LOGIC_VECTOR (12 downto 0);
               pc_out : out STD_LOGIC_VECTOR (10 downto 0));
    end component;

    component program_memory is
        Port ( clk : in STD_LOGIC;
               addr_in : in STD_LOGIC_VECTOR (10 downto 0);
               dout : out STD_LOGIC_VECTOR (13 downto 0));
    end component;

    component slice_z_flag is
        Port ( flags : in STD_LOGIC_VECTOR (2 downto 0);
               z_flag : out STD_LOGIC);
    end component;

    component we_rst_reg_14 is
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               rest : in STD_LOGIC;
               din : in STD_LOGIC_VECTOR (13 downto 0);
               dout : out STD_LOGIC_VECTOR (13 downto 0));
    end component;

    component decode_and_control is
        Port ( clk : in STD_LOGIC;
               ir_in : in STD_LOGIC_VECTOR (13 downto 0);
               z_flag : in STD_LOGIC;
               ir_rest : out STD_LOGIC;
               we_ir : out STD_LOGIC;
               we_reg_file : out STD_LOGIC;
               we_wreg : out STD_LOGIC;
               we_flags : out STD_LOGIC_VECTOR (2 downto 0);
               addrmux_s : out STD_LOGIC;
               datamux_s : out STD_LOGIC;
               alu_op : out STD_LOGIC_VECTOR (4 downto 0);
               stack_enable : out STD_LOGIC;
               stack_push_pop : out STD_LOGIC;
               str_k_to_pc : out STD_LOGIC;
               str_pc_from_stack : out STD_LOGIC;
               gie_set : out STD_LOGIC;
               pre_wreg_mux_retlw_s : out STD_LOGIC;
               we_flags_caching_reg : out STD_LOGIC;
               str_inc_pc : out STD_LOGIC);
    end component;

    component mux_8 is
        Port ( d0 : in STD_LOGIC_VECTOR (7 downto 0);
               d1 : in STD_LOGIC_VECTOR (7 downto 0);
               s : in STD_LOGIC;
               dout : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component we_reg_8 is
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               din : in STD_LOGIC_VECTOR (7 downto 0);
               dout : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component slice_alu is
        Port ( status_in : in STD_LOGIC_VECTOR (7 downto 0);
               ir_in : in STD_LOGIC_VECTOR (13 downto 0);
               bbb_out : out STD_LOGIC_VECTOR (2 downto 0);
               curC_out : out STD_LOGIC);
    end component;

    component alu is
        Port ( arg1 : in STD_LOGIC_VECTOR (7 downto 0);
               arg2 : in STD_LOGIC_VECTOR (7 downto 0);
               op : in STD_LOGIC_VECTOR(4 downto 0);
               bbb : in STD_LOGIC_VECTOR (2 downto 0);
               curC : in STD_LOGIC;
               res : out STD_LOGIC_VECTOR (7 downto 0);
               flags : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal u_register_file_pom_status_out_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_ir_reg_pom_dout_sig : STD_LOGIC_VECTOR(13 downto 0);
    signal u_register_file_pom_fsr_out_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_slice_addr_mux_pom_indirect_out_sig : STD_LOGIC_VECTOR(8 downto 0);
    signal u_slice_addr_mux_pom_direct_out_sig : STD_LOGIC_VECTOR(8 downto 0);
    signal u_decode_and_control_pom_stack_enable_sig : STD_LOGIC;
    signal u_decode_and_control_pom_push_pop_sig : STD_LOGIC;
    signal u_register_file_pom_pc_out_sig : STD_LOGIC_VECTOR(12 downto 0);
    signal u_stack_pom_stack_out_sig : STD_LOGIC_VECTOR(12 downto 0);
    signal u_decode_and_control_pom_we_flags_caching_reg_sig : STD_LOGIC;
    signal u_alu_pom_flags_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal u_flags_reg_pom_dout_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal u_decode_and_control_pom_addrmux_s_sig : STD_LOGIC;
    signal u_addr_mux_pom_dout_sig : STD_LOGIC_VECTOR(8 downto 0);
    signal u_slice_datamux_ir_pom_ir_8_out : STD_LOGIC_VECTOR(7 downto 0);
    signal u_slice_datamux_ir_pom_ir_11_out : STD_LOGIC_VECTOR(10 downto 0);
    signal u_decode_and_control_pom_we_reg_file_sig : STD_LOGIC;
    signal u_alu_pom_res_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_register_file_pom_data_out_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_decode_and_control_pom_str_pc_from_stack_sig : STD_LOGIC;
    signal u_decode_and_control_pom_str_k_to_pc_sig : STD_LOGIC;
    signal u_decode_and_control_pom_str_inc_pc_sig : STD_LOGIC;
    signal u_decode_and_control_pom_gie_set_sig : STD_LOGIC;
    signal u_decode_and_control_pom_we_flags_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal u_slice_pc_pom_pc_out_sig : STD_LOGIC_VECTOR(10 downto 0);
    signal u_program_memory_pom_dout_sig : STD_LOGIC_VECTOR(13 downto 0);
    signal u_slice_z_flag_pom_z_flag_sig: STD_LOGIC;
    signal u_decode_and_control_pom_we_ir_sig : STD_LOGIC;
    signal u_decode_and_control_pom_ir_rest_sig : STD_LOGIC;
    signal u_decode_and_control_pom_we_wreg_sig : STD_LOGIC;
    signal u_decode_and_control_pom_datamux_s_sig : STD_LOGIC;
    signal u_decode_and_control_pom_alu_op_sig : STD_LOGIC_VECTOR(4 downto 0);
    signal u_decode_and_control_pom_pre_wreg_mux_retlw_s_sig : STD_LOGIC;
    signal u_retlw_mux_pom_dout_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_wreg_pom_dout_sig : STD_LOGIC_VECTOR(7 downto 0);
    signal u_slice_alu_pom_bbb_out_sig : STD_LOGIC_VECTOR(2 downto 0);
    signal u_slice_alu_pom_curC_out_sig : STD_LOGIC;
    signal u_datamux_mux_pom_dout_sig : STD_LOGIC_VECTOR(7 downto 0);


begin

    u_slice_addr_mux: slice_addr_mux
    port map(
        status_in => u_register_file_pom_status_out_sig,
        ir_in => u_ir_reg_pom_dout_sig,
        fsr_in => u_register_file_pom_fsr_out_sig,
        indirect_out => u_slice_addr_mux_pom_indirect_out_sig,
        direct_out => u_slice_addr_mux_pom_direct_out_sig
    );

    u_stack: stack
    port map(
        clk => clk,
        ena => u_decode_and_control_pom_stack_enable_sig,
        push_pop => u_decode_and_control_pom_push_pop_sig,
        stack_in => u_register_file_pom_pc_out_sig,
        stack_out => u_stack_pom_stack_out_sig
    );

    u_flags_reg: we_reg_3
    port map(
        clk => clk,
        we => u_decode_and_control_pom_we_flags_caching_reg_sig,
        din => u_alu_pom_flags_sig,
        dout => u_flags_reg_pom_dout_sig
    );

    u_addr_mux: mux_9
    port map(
        d0 => u_slice_addr_mux_pom_indirect_out_sig,
        d1 => u_slice_addr_mux_pom_direct_out_sig,
        s => u_decode_and_control_pom_addrmux_s_sig,
        dout => u_addr_mux_pom_dout_sig
    );

    u_slice_datamux_ir: slice_datamux_ir
    port map(
        ir_in => u_ir_reg_pom_dout_sig,
        ir_8_out => u_slice_datamux_ir_pom_ir_8_out,
        ir_11_out => u_slice_datamux_ir_pom_ir_11_out
    );


    u_register_file: register_file
    port map(
        clk => clk,
        we => u_decode_and_control_pom_we_reg_file_sig,
        addr_in => u_addr_mux_pom_dout_sig,
        data_in => u_alu_pom_res_sig,
        data_out => u_register_file_pom_data_out_sig,
        value_from_stack => u_stack_pom_stack_out_sig,
        str_from_stack => u_decode_and_control_pom_str_pc_from_stack_sig,
        value_k_to_pc => u_slice_datamux_ir_pom_ir_11_out,
        str_k_to_pc => u_decode_and_control_pom_str_k_to_pc_sig,
        str_inc_pc => u_decode_and_control_pom_str_inc_pc_sig,
        gie_set => u_decode_and_control_pom_gie_set_sig,
        status_flags => u_flags_reg_pom_dout_sig,
        we_status_flags => u_decode_and_control_pom_we_flags_sig,
        pc_out => u_register_file_pom_pc_out_sig,
        fsr_out => u_register_file_pom_fsr_out_sig,
        status_out => u_register_file_pom_status_out_sig
    );
 
    u_slice_pc: slice_pc
    port map(
        pc_in => u_register_file_pom_pc_out_sig,
        pc_out => u_slice_pc_pom_pc_out_sig
    );

    u_program_memory: program_memory
    port map(
        clk => clk,
        addr_in => u_slice_pc_pom_pc_out_sig,
        dout => u_program_memory_pom_dout_sig
    );

    u_slice_z_flag: slice_z_flag
    port map(
        flags => u_flags_reg_pom_dout_sig,
        z_flag => u_slice_z_flag_pom_z_flag_sig
    );

    u_ir_reg: we_rst_reg_14
    port map(
        clk => clk,
        we => u_decode_and_control_pom_we_ir_sig,
        rest => u_decode_and_control_pom_ir_rest_sig,
        din => u_program_memory_pom_dout_sig,
        dout => u_ir_reg_pom_dout_sig
    );

    u_decode_and_control: decode_and_control
    port map(
        clk => clk,
        ir_in => u_ir_reg_pom_dout_sig,
        z_flag => u_slice_z_flag_pom_z_flag_sig,
        ir_rest => u_decode_and_control_pom_ir_rest_sig,
        we_ir => u_decode_and_control_pom_we_ir_sig,
        we_reg_file => u_decode_and_control_pom_we_reg_file_sig,
        we_wreg => u_decode_and_control_pom_we_wreg_sig,
        we_flags => u_decode_and_control_pom_we_flags_sig,
        addrmux_s => u_decode_and_control_pom_addrmux_s_sig,
        datamux_s => u_decode_and_control_pom_datamux_s_sig,
        alu_op => u_decode_and_control_pom_alu_op_sig,
        stack_enable => u_decode_and_control_pom_stack_enable_sig,
        stack_push_pop => u_decode_and_control_pom_push_pop_sig,
        str_k_to_pc => u_decode_and_control_pom_str_k_to_pc_sig,
        str_pc_from_stack => u_decode_and_control_pom_str_pc_from_stack_sig,
        gie_set => u_decode_and_control_pom_gie_set_sig,
        pre_wreg_mux_retlw_s => u_decode_and_control_pom_pre_wreg_mux_retlw_s_sig,
        we_flags_caching_reg => u_decode_and_control_pom_we_flags_caching_reg_sig,
        str_inc_pc => u_decode_and_control_pom_str_inc_pc_sig
    );

    u_retlw_mux: mux_8
    port map(
        d0 => u_alu_pom_res_sig,
        d1 => u_slice_datamux_ir_pom_ir_8_out,
        s => u_decode_and_control_pom_pre_wreg_mux_retlw_s_sig,
        dout => u_retlw_mux_pom_dout_sig
    );

    u_wreg: we_reg_8
    port map(
        clk => clk,
        we => u_decode_and_control_pom_we_wreg_sig,
        din => u_retlw_mux_pom_dout_sig,
        dout => u_wreg_pom_dout_sig
    );

    u_slice_alu: slice_alu
    port map(
        status_in => u_register_file_pom_status_out_sig,
        ir_in => u_ir_reg_pom_dout_sig,
        bbb_out => u_slice_alu_pom_bbb_out_sig,
        curC_out => u_slice_alu_pom_curC_out_sig
    );

    u_datamux_mux: mux_8
    port map(
        d0 => u_slice_datamux_ir_pom_ir_8_out,
        d1 => u_register_file_pom_data_out_sig,
        s => u_decode_and_control_pom_datamux_s_sig,
        dout => u_datamux_mux_pom_dout_sig
    );

    u_alu: alu
    port map(
        arg1 => u_wreg_pom_dout_sig,
        arg2 => u_datamux_mux_pom_dout_sig,
        op => u_decode_and_control_pom_alu_op_sig,
        bbb => u_slice_alu_pom_bbb_out_sig,
        curC => u_slice_alu_pom_curC_out_sig,
        res => u_alu_pom_res_sig,
        flags => u_alu_pom_flags_sig
    );

    status_out <= u_register_file_pom_status_out_sig;

    ir_out <= u_ir_reg_pom_dout_sig;

    fsr_out <= u_register_file_pom_fsr_out_sig;

    stack_enable <= u_decode_and_control_pom_stack_enable_sig;

    stack_push_pop <= u_decode_and_control_pom_push_pop_sig;

    pc_out <= u_register_file_pom_pc_out_sig;

    stack_out <= u_stack_pom_stack_out_sig;

    we_flags_caching_reg <= u_decode_and_control_pom_we_flags_caching_reg_sig;

    alu_flags <= u_alu_pom_flags_sig;

    status_flags <= u_flags_reg_pom_dout_sig;

    addrmux_s <= u_decode_and_control_pom_addrmux_s_sig;

    reg_file_addr_in <= u_addr_mux_pom_dout_sig;

    we_reg_file <= u_decode_and_control_pom_we_reg_file_sig;

    alu_res <= u_alu_pom_res_sig;

    reg_file_data_out <= u_register_file_pom_data_out_sig;

    str_pc_from_stack <= u_decode_and_control_pom_str_pc_from_stack_sig;

    str_k_to_pc <= u_decode_and_control_pom_str_k_to_pc_sig;

    str_inc_pc <= u_decode_and_control_pom_str_inc_pc_sig;

    gie_set <= u_decode_and_control_pom_gie_set_sig;

    we_status_flags <= u_decode_and_control_pom_we_flags_sig;

    pm_out <= u_program_memory_pom_dout_sig;

    we_ir <= u_decode_and_control_pom_we_ir_sig;

    ir_rest <= u_decode_and_control_pom_ir_rest_sig;

    we_wreg <= u_decode_and_control_pom_we_wreg_sig;

    datamux_s <= u_decode_and_control_pom_datamux_s_sig;

    alu_op <= u_decode_and_control_pom_alu_op_sig;

    pre_wreg_mux_retlw_s <= u_decode_and_control_pom_pre_wreg_mux_retlw_s_sig;

    wreg_in <= u_retlw_mux_pom_dout_sig;

    wreg_out <= u_wreg_pom_dout_sig;

    datamux_out <= u_datamux_mux_pom_dout_sig;

end Behavioral;
