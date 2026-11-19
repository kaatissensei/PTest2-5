extends Control

var is_a : bool = true
var a_questions : Array[String]
var b_questions : Array[String]
var three_questions : Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_a_questions()
	load_b_questions()

func _set_is_a(tf: bool):
	is_a = tf
	
	choose_3()
	$CanvasLayer/AB.text = "A" if is_a else "B"
	
func choose_3():
	if is_a:
		a_questions.shuffle()
		three_questions = a_questions.slice(0,3)
	else:
		b_questions.shuffle()
		three_questions = b_questions.slice(0,3)
	%QuestionText.text = ""
	
func load_a_questions() -> void:
	a_questions = ["Are you a guest during your homestay?",
	"What do you have to follow during your homestay?",
	"What should you do if you have any questions?",
	"Do you have to speak perfect English during your homestay?",
	"What is important during your homestay?"]

func load_b_questions() -> void:
	b_questions = ["What does 'universal' mean?",
	"Who is universal desing useful for?",
	"Where can you find products with a universal design?",
	"Can you give one example of universal deign?",
		
	]


func _get_question(array_num: int) -> void:
	%QuestionText.text = three_questions[array_num]
