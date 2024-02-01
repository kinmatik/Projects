extends CharacterBody2D

var diraction = Vector2() # اتجاه حركة اللاعب 
var speed = 300 # سرعة الحركة 
# متغير عميل الملاحة لايجاد المسار
@onready var nav = $NavigationAgent2D

func _process(delta):
	var target = Vector2() # النقطة النمطلوب الوصول اليها 
	if Input.is_action_just_pressed("left_click"): # الحصول على ضغطة الفارة من المستخدم
		target = get_global_mouse_position() # تعين مكان الفارة لمتغير الهدف 
		nav.target_position = target # ايجاد المسار من اللاعب للنقطة الهدف 
		pass
	# اظهار المسار باستخدام عقدة الخط (ليس له دخل في التقنية الاساسية)
	owner.get_node("Line2D").points = nav.get_current_navigation_path()
	# تعين الاتجاه الذي من المفترض على اللاعب التحرك اليه 
	diraction = nav.get_next_path_position() - global_position
	# تعين السرعة المتجهة للاعب باستخدام الاتجاه والسرعة 
	velocity = diraction.normalized() * speed
	# التاكد ان اللاعب وصل للنطقة النهائية ام لا
	if nav.is_navigation_finished():
		velocity = Vector2() # في حال وصل للنقطة النهاية يتوقف عن الحركة 
	
	# امر التحرك 
	move_and_slide()
	pass
