import numpy as np
#----------------------------------------------------------------
def get_DOFs(
    poly_degree,
    number_of_elements_per_direction,
    dim):
    DOFs_per_dim = number_of_elements_per_direction*(poly_degree+1)

    DOFs_total = 1.0
    for d in range(0,dim):
        DOFs_total *= DOFs_per_dim

    return [DOFs_per_dim,DOFs_total]
#----------------------------------------------------------------
def get_reference_DOFs_per_core(
    poly_degree,
    number_of_elements_per_direction,
    dim,
    tasks_per_node,
    number_of_nodes):

    DOFs_per_dim, DOFs_total = get_DOFs(
                                poly_degree,
                                number_of_elements_per_direction,
                                dim)

    # Resources used before:
    # total_memory = number_of_nodes*mem_per_node
    total_number_of_processes=tasks_per_node*number_of_nodes
    DOFs_per_core=DOFs_total/total_number_of_processes
    print("Reference:")
    print("- DOFs per dim = %i" % DOFs_per_dim)
    print("- Total DOFs = %i" % DOFs_total)
    print("- Total cores = %i" % total_number_of_processes)
    print("- DOFs per core = %.1f" % DOFs_per_core)
    print(" ")
    return DOFs_per_core
#----------------------------------------------------------------
def determine_resources_from_reference_DOFs_per_core(
    poly_degree,
    number_of_elements_per_direction,
    dim,
    DOFs_per_core):

    DOFs_per_dim, DOFs_total = get_DOFs(
                                poly_degree,
                                number_of_elements_per_direction,
                                dim)

    total_number_of_processes = DOFs_total/DOFs_per_core

    print("Resources for new DOFs:")
    print("- DOFs per core = %.1f" % DOFs_per_core)
    print("- DOFs per dim = %i" % DOFs_per_dim)
    print("- Total DOFs = %i" % DOFs_total)
    print("- Total cores = %i" % total_number_of_processes)
    print("- Number of full nodes (64 cores each) = %.1f" % (total_number_of_processes/64))
    print("- Number of quarter nodes (16 cores each) = %.1f" % (total_number_of_processes/16))
    print(" ")
    return
#----------------------------------------------------------------  
#================================================================
# for the 96^3 DOF TGV
ref_DOFs_per_core = get_reference_DOFs_per_core(
                    poly_degree=5, 
                    number_of_elements_per_direction=16,
                    dim=3,
                    tasks_per_node=64,
                    number_of_nodes=4)

# resources for new DOFs
determine_resources_from_reference_DOFs_per_core(
    poly_degree=3,
    number_of_elements_per_direction=64,
    dim=3,
    DOFs_per_core=ref_DOFs_per_core)

# Narval parameters
# Ref: https://docs.computecanada.ca/wiki/Advanced_MPI_scheduling
# mem_per_node = 249.0 # GiB
# tasks_per_node = 64
# mem_per_task = 3.9 