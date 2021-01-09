--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        collidable = true,
        consumable = false,
        interactable = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'tiles',
        frame = 111,
        width= 16,
        height = 16,
        solid = true,
        collidable = false,
        consumable = false,
        interactable = true,
        defaultState = 'default',
        states = {
            ['default'] = {
                frame = 111
            }
        }
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        collidable = false,
        consumable = true,
        interactable = false,
        defaultState = 'default',
        states = {
            ['default'] = {
                frame = 5
            }
        },
    }
}