//Initial state setup
state=ACTORSTATES.PLAYER;

//Player definitions
walkSpeed=1;
runSpeed=2.5;
collisionLayer="Collision";
collisionMap=layer_tilemap_get_id("Collision");

//Enum-matching sprite arrays
walkSprite[CARDINALS.RIGHT]=rightSprite;
walkSprite[CARDINALS.UP]=upSprite;
walkSprite[CARDINALS.LEFT]=leftSprite;
walkSprite[CARDINALS.DOWN]=downSprite;

//Dynamic movement variables
hsp=0;
hsp=0;
dir=CARDINALS.DOWN;