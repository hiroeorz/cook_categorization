all: clean lmd model

CONVERTER=../build/tools/convert_imageset
CAFFE=../build/tools/caffe

clean:
	rm -rf models
	rm -rf cookpad_test_lmd 
	rm -rf cookpad_train_lmd 

lmd:
	@$(CONVERTER) -resize_height=50 -resize_width=50 -shuffle=true ./ ./train.txt cookpad_train_lmd
	@$(CONVERTER) -resize_height=50 -resize_width=50 -shuffle=true ./ ./train.txt cookpad_test_lmd

model:
	@if [ ! -d models ]; then \
	  mkdir models; \
	fi
	@$(CAFFE) train -solver=cookpad_solver.prototxt
