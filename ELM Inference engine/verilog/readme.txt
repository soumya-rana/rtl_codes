Information regarding all the verilog files in this folder:


	1. top_module.v : It is the top module where the submodules (deserializer, input_to_hidden, hidden_to_output, max_eval) are instantiated.

	2. input_to_hidden.v : It is the module that calculates hidden neuron values sequentially. Contains lfsr module to generate random weights.

	3. lfsr.v : It is the 16 bit Linear Feedback Shift Register used for generating random weights for hidden layer.

	4. deserializer.v : It is the deserializer module that converts 16 bit serial data chunks into 256 bit parallel data.

	5. hidden_to_output.v : It is the module that calculates the output node values from the hidden neurons. Contains the multiplier_32_by_16 module and the ROMs (W21_1 to W21_10). The row indexing is from 0 to "HIDDEN_NEURONS - 1".

	6. multiplier_32_by_16.v : Signed multiplier that performs multiplcation of 2 numbers (one 32 bit and another 16 bit) and returns a 48 bit output. 

	7. max_eval.v : Performs the one-hot encoding on the output produced by hidden_to_output.v to give final output.

	8. W21_1 - W21_10 : ROMs used for storing W21 matrix elements. W21_i contains the i-th column of W21 matrix. 



(files mentioned above are all for simulation as well as synthesis. files mentioned after this line are for simulation only)



	9. elm_testbench.v : Testbench that provides 10 input images for testing. Contains the test_images (ROM for storing the test images), test_images_answers (ROM for storing answers of test images), serializer (converts 256 bit images to 16 bit serial chunks) modules. The variable "index" values can be tweaked (1 - 493) to see results for any arbitrary image from the testing dataset. 

	10. test_images.v : ROM for storing the 493 images data and instantiating in testbench. 

	11. test_images_answers.v : ROM for storing the answer for the 493 images data and instantiating in testbench.

	12. serializer.v : It is used for converting the 256 bit image into 16 bit serial chunks that is provided as input to the top module.