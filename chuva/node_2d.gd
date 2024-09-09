extends Node2D
# Variáveis para a geração dos itens
@export var item_scene: PackedScene #Item que será spawnado
@export var spawn_rate: float = 0.005 #Tempo de espera entre o spawn dos itens
@export var spawn_area: Rect2 = Rect2(Vector2(0, 0), Vector2(1200, 600)) #Definir área de spawn
# Referência ao Timer
var spawn_timer: Timer #Refêrencia do Timer


func _ready():
	# Configura o timer para controlar a geração de itens
	spawn_timer = $Timer #Chama o Timer ao iniciar do jogo
	spawn_timer.wait_time = spawn_rate #Tempo de Espera
	spawn_timer.timeout.connect(_on_SpawnTimer_timeout) #Ao fim do tempo, ele chamará uma função
	spawn_timer.start() 

func _on_SpawnTimer_timeout():
	# Gera um novo item
	var item_instance = item_scene.instantiate() #Gera uma nova instancia do Item na cena
	var spawn_position = Vector2( #Vector2 utilizado para Gerar a função do Spawn usando X e Y
		randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),#valor aleatório de X
		randf_range(50,100))# valor de Y entre 50 a 100
	item_instance.position = spawn_position # usando a variável anterior para definir a posição da instância
	add_child(item_instance)# Adiciona o item à cena
