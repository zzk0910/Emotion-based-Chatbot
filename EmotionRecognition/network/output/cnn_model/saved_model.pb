Ѐ
??
:
Add
x"T
y"T
z"T"
Ttype:
2	
?
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
.
Identity

input"T
output"T"	
Ttype
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
?
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?"serve*1.12.02b'v1.12.0-rc2-3-ga6d8ffae09'?d
s
inputsPlaceholder*
dtype0*!
shape:??????????*,
_output_shapes
:??????????
?
6cnn_layer1/W_conv1d/Initializer/truncated_normal/shapeConst*
dtype0*!
valueB"   ?      *
_output_shapes
:*&
_class
loc:@cnn_layer1/W_conv1d
?
5cnn_layer1/W_conv1d/Initializer/truncated_normal/meanConst*
valueB
 *    *&
_class
loc:@cnn_layer1/W_conv1d*
_output_shapes
: *
dtype0
?
7cnn_layer1/W_conv1d/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *&
_class
loc:@cnn_layer1/W_conv1d*
valueB
 *
ף<
?
@cnn_layer1/W_conv1d/Initializer/truncated_normal/TruncatedNormalTruncatedNormal6cnn_layer1/W_conv1d/Initializer/truncated_normal/shape*
seed2 *
T0*#
_output_shapes
:?*
dtype0*

seed *&
_class
loc:@cnn_layer1/W_conv1d
?
4cnn_layer1/W_conv1d/Initializer/truncated_normal/mulMul@cnn_layer1/W_conv1d/Initializer/truncated_normal/TruncatedNormal7cnn_layer1/W_conv1d/Initializer/truncated_normal/stddev*#
_output_shapes
:?*
T0*&
_class
loc:@cnn_layer1/W_conv1d
?
0cnn_layer1/W_conv1d/Initializer/truncated_normalAdd4cnn_layer1/W_conv1d/Initializer/truncated_normal/mul5cnn_layer1/W_conv1d/Initializer/truncated_normal/mean*#
_output_shapes
:?*
T0*&
_class
loc:@cnn_layer1/W_conv1d
?
cnn_layer1/W_conv1d
VariableV2*
shared_name *#
_output_shapes
:?*&
_class
loc:@cnn_layer1/W_conv1d*
dtype0*
shape:?*
	container 
?
cnn_layer1/W_conv1d/AssignAssigncnn_layer1/W_conv1d0cnn_layer1/W_conv1d/Initializer/truncated_normal*#
_output_shapes
:?*
validate_shape(*&
_class
loc:@cnn_layer1/W_conv1d*
use_locking(*
T0
?
cnn_layer1/W_conv1d/readIdentitycnn_layer1/W_conv1d*#
_output_shapes
:?*&
_class
loc:@cnn_layer1/W_conv1d*
T0
n
$cnn_layer1/convolution/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB:
g
%cnn_layer1/convolution/ExpandDims/dimConst*
dtype0*
value	B :*
_output_shapes
: 
?
!cnn_layer1/convolution/ExpandDims
ExpandDimsinputs%cnn_layer1/convolution/ExpandDims/dim*

Tdim0*0
_output_shapes
:??????????*
T0
i
'cnn_layer1/convolution/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 
?
#cnn_layer1/convolution/ExpandDims_1
ExpandDimscnn_layer1/W_conv1d/read'cnn_layer1/convolution/ExpandDims_1/dim*'
_output_shapes
:?*

Tdim0*
T0
?
cnn_layer1/convolution/Conv2DConv2D!cnn_layer1/convolution/ExpandDims#cnn_layer1/convolution/ExpandDims_1*/
_output_shapes
:?????????*
use_cudnn_on_gpu(*
paddingVALID*
	dilations
*
strides
*
T0*
data_formatNHWC
?
cnn_layer1/convolution/SqueezeSqueezecnn_layer1/convolution/Conv2D*
T0*
squeeze_dims
*+
_output_shapes
:?????????
?
%cnn_layer1/b_conv1d/Initializer/ConstConst*&
_class
loc:@cnn_layer1/b_conv1d*
dtype0*
valueB*    *
_output_shapes
:
?
cnn_layer1/b_conv1d
VariableV2*
shape:*
dtype0*
	container *
_output_shapes
:*&
_class
loc:@cnn_layer1/b_conv1d*
shared_name 
?
cnn_layer1/b_conv1d/AssignAssigncnn_layer1/b_conv1d%cnn_layer1/b_conv1d/Initializer/Const*
use_locking(*
_output_shapes
:*
validate_shape(*&
_class
loc:@cnn_layer1/b_conv1d*
T0
?
cnn_layer1/b_conv1d/readIdentitycnn_layer1/b_conv1d*&
_class
loc:@cnn_layer1/b_conv1d*
_output_shapes
:*
T0
?
cnn_layer1/addAddcnn_layer1/convolution/Squeezecnn_layer1/b_conv1d/read*+
_output_shapes
:?????????*
T0
]
cnn_layer1/ReluRelucnn_layer1/add*+
_output_shapes
:?????????*
T0
\
pool_layer1/ExpandDims/dimConst*
dtype0*
value	B :*
_output_shapes
: 
?
pool_layer1/ExpandDims
ExpandDimscnn_layer1/Relupool_layer1/ExpandDims/dim*

Tdim0*/
_output_shapes
:?????????*
T0
?
pool_layer1/MaxPoolMaxPoolpool_layer1/ExpandDims*
T0*
data_formatNHWC*/
_output_shapes
:?????????*
paddingVALID*
ksize
*
strides

?
pool_layer1/SqueezeSqueezepool_layer1/MaxPool*+
_output_shapes
:?????????*
T0*
squeeze_dims

d
flatten_layer/shapeConst*
valueB"????$   *
dtype0*
_output_shapes
:
?
flatten_layerReshapepool_layer1/Squeezeflatten_layer/shape*
T0*
Tshape0*'
_output_shapes
:?????????$
?
+output/W/Initializer/truncated_normal/shapeConst*
valueB"$      *
_output_shapes
:*
dtype0*
_class
loc:@output/W
?
*output/W/Initializer/truncated_normal/meanConst*
_class
loc:@output/W*
valueB
 *    *
_output_shapes
: *
dtype0
?
,output/W/Initializer/truncated_normal/stddevConst*
valueB
 *???=*
_class
loc:@output/W*
dtype0*
_output_shapes
: 
?
5output/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormal+output/W/Initializer/truncated_normal/shape*
T0*
seed2 *

seed *
_class
loc:@output/W*
_output_shapes

:$*
dtype0
?
)output/W/Initializer/truncated_normal/mulMul5output/W/Initializer/truncated_normal/TruncatedNormal,output/W/Initializer/truncated_normal/stddev*
T0*
_output_shapes

:$*
_class
loc:@output/W
?
%output/W/Initializer/truncated_normalAdd)output/W/Initializer/truncated_normal/mul*output/W/Initializer/truncated_normal/mean*
_class
loc:@output/W*
T0*
_output_shapes

:$
?
output/W
VariableV2*
shared_name *
_class
loc:@output/W*
	container *
shape
:$*
dtype0*
_output_shapes

:$
?
output/W/AssignAssignoutput/W%output/W/Initializer/truncated_normal*
use_locking(*
_output_shapes

:$*
T0*
_class
loc:@output/W*
validate_shape(
i
output/W/readIdentityoutput/W*
_output_shapes

:$*
_class
loc:@output/W*
T0
?
output/b/Initializer/ConstConst*
_output_shapes
:*
_class
loc:@output/b*
valueB*    *
dtype0
?
output/b
VariableV2*
_class
loc:@output/b*
dtype0*
	container *
shape:*
_output_shapes
:*
shared_name 
?
output/b/AssignAssignoutput/boutput/b/Initializer/Const*
T0*
_class
loc:@output/b*
_output_shapes
:*
validate_shape(*
use_locking(
e
output/b/readIdentityoutput/b*
_output_shapes
:*
_class
loc:@output/b*
T0
?
output/MatMulMatMulflatten_layeroutput/W/read*
T0*
transpose_a( *'
_output_shapes
:?????????*
transpose_b( 
a

output/addAddoutput/MatMuloutput/b/read*
T0*'
_output_shapes
:?????????
Y
output/IdentityIdentity
output/add*
T0*'
_output_shapes
:?????????
U
SoftmaxSoftmaxoutput/Identity*
T0*'
_output_shapes
:?????????
R
ArgMax/dimensionConst*
dtype0*
value	B :*
_output_shapes
: 
x
ArgMaxArgMaxSoftmaxArgMax/dimension*

Tidx0*
output_type0	*
T0*#
_output_shapes
:?????????
j
initNoOp^cnn_layer1/W_conv1d/Assign^cnn_layer1/b_conv1d/Assign^output/W/Assign^output/b/Assign
P

save/ConstConst*
dtype0*
valueB Bmodel*
_output_shapes
: 
?
save/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*Q
valueHBFBcnn_layer1/W_conv1dBcnn_layer1/b_conv1dBoutput/WBoutput/b
k
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB B B B 
?
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicescnn_layer1/W_conv1dcnn_layer1/b_conv1doutput/Woutput/b*
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_class
loc:@save/Const*
_output_shapes
: *
T0
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*Q
valueHBFBcnn_layer1/W_conv1dBcnn_layer1/b_conv1dBoutput/WBoutput/b*
_output_shapes
:*
dtype0
}
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
valueBB B B B *
dtype0
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*$
_output_shapes
::::
?
save/AssignAssigncnn_layer1/W_conv1dsave/RestoreV2*
use_locking(*#
_output_shapes
:?*
T0*&
_class
loc:@cnn_layer1/W_conv1d*
validate_shape(
?
save/Assign_1Assigncnn_layer1/b_conv1dsave/RestoreV2:1*
use_locking(*
validate_shape(*
T0*
_output_shapes
:*&
_class
loc:@cnn_layer1/b_conv1d
?
save/Assign_2Assignoutput/Wsave/RestoreV2:2*
use_locking(*
validate_shape(*
_output_shapes

:$*
_class
loc:@output/W*
T0
?
save/Assign_3Assignoutput/bsave/RestoreV2:3*
_output_shapes
:*
_class
loc:@output/b*
T0*
use_locking(*
validate_shape(
V
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3
R
save_1/ConstConst*
valueB Bmodel*
_output_shapes
: *
dtype0
?
save_1/StringJoin/inputs_1Const*
_output_shapes
: *
dtype0*<
value3B1 B+_temp_47bc1233fec047348ae967402b09d799/part
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
value	B : *
dtype0
?
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
?
save_1/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*Q
valueHBFBcnn_layer1/W_conv1dBcnn_layer1/b_conv1dBoutput/WBoutput/b*
dtype0
|
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicescnn_layer1/W_conv1dcnn_layer1/b_conv1doutput/Woutput/b"/device:CPU:0*
dtypes
2
?
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*
_output_shapes
: *)
_class
loc:@save_1/ShardedFilename
?
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
N*

axis *
_output_shapes
:*
T0
?
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
?
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
?
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*Q
valueHBFBcnn_layer1/W_conv1dBcnn_layer1/b_conv1dBoutput/WBoutput/b*
_output_shapes
:

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B B B 
?
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*$
_output_shapes
::::
?
save_1/AssignAssigncnn_layer1/W_conv1dsave_1/RestoreV2*
T0*&
_class
loc:@cnn_layer1/W_conv1d*#
_output_shapes
:?*
use_locking(*
validate_shape(
?
save_1/Assign_1Assigncnn_layer1/b_conv1dsave_1/RestoreV2:1*
T0*
validate_shape(*
use_locking(*
_output_shapes
:*&
_class
loc:@cnn_layer1/b_conv1d
?
save_1/Assign_2Assignoutput/Wsave_1/RestoreV2:2*
_output_shapes

:$*
use_locking(*
validate_shape(*
T0*
_class
loc:@output/W
?
save_1/Assign_3Assignoutput/bsave_1/RestoreV2:3*
T0*
_class
loc:@output/b*
use_locking(*
_output_shapes
:*
validate_shape(
b
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"?
	variables??
?
cnn_layer1/W_conv1d:0cnn_layer1/W_conv1d/Assigncnn_layer1/W_conv1d/read:022cnn_layer1/W_conv1d/Initializer/truncated_normal:08
z
cnn_layer1/b_conv1d:0cnn_layer1/b_conv1d/Assigncnn_layer1/b_conv1d/read:02'cnn_layer1/b_conv1d/Initializer/Const:08
Y

output/W:0output/W/Assignoutput/W/read:02'output/W/Initializer/truncated_normal:08
N

output/b:0output/b/Assignoutput/b/read:02output/b/Initializer/Const:08"?
trainable_variables??
?
cnn_layer1/W_conv1d:0cnn_layer1/W_conv1d/Assigncnn_layer1/W_conv1d/read:022cnn_layer1/W_conv1d/Initializer/truncated_normal:08
z
cnn_layer1/b_conv1d:0cnn_layer1/b_conv1d/Assigncnn_layer1/b_conv1d/read:02'cnn_layer1/b_conv1d/Initializer/Const:08
Y

output/W:0output/W/Assignoutput/W/read:02'output/W/Initializer/truncated_normal:08
N

output/b:0output/b/Assignoutput/b/read:02output/b/Initializer/Const:08*?
serving_defaultv
)
x$
inputs:0??????????-
y(
output/Identity:0?????????tensorflow/serving/predict*?
predict_textv
)
x$
inputs:0??????????-
y(
output/Identity:0?????????tensorflow/serving/predict