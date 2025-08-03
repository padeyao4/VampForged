extends Node

var player_hp: int = 100
var gun_damage: int = 1
var bullet_speed: float = 120
var bullet_ways: int = 1 # 子弹弹道
var bullet_nums: int = 1 # 每个弹道射击的子弹数量，每秒钟子弹的数量
var bullet_through: int = 1 # 每个子弹的穿透敌怪数量
var bullet_max_len: float = 200 # 每个走的最远距离
