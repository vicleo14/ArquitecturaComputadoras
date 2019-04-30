#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_7000HE
set_option -package TG144C
set_option -speed_grade -5

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false
set_option -frequency 1
set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
add_file -vhdl {C:/lscc/diamond/3.10_x64/cae_library/synthesis/vhdl/machxo2.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/coder00.vhdl}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/contRead00.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/contring00.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/div00.vhdl}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/mux00.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/osc00.vhdl}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/packagediv00.vhdl}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/source/topdiv00.vhdl}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/contWrite.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/packagestack01.vhd}
add_file -vhdl -lib "work" {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/topstack01.vhd}

#-- top module name
set_option -top_module topstack01

#-- set result format/file last
project -result_file {D:/Sexto_Semestre/Arquitectura_Computadora/projectMachXO2/stack01/stack01/stack01_stack01.edi}

#-- error message log file
project -log_file {stack01_stack01.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
