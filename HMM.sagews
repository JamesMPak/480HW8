︠5b9b7078-8fd5-46a7-87a9-7640e528fe39︠
A = matrix(RR, 4, [.95, .05, 0,  0,  # asleep
                   0, .6, .4, 0,  # breakfast
                    0,   0, .75, .25, # work
                   .15,   0,   .05, .80]) # back home

statements = ['I am hungry', 'Time to work', 'I am back home', '*asleep*', 'I am tired']
B = matrix(RR, 4, 5, [.05,0,0,.95,0,  # asleep
                      .6,.4,0,0,0,  # breakfast
                      0,1,0,0,0, # work
                      0,.05,.8,0,.15]) #back home

initial_position = [1,0,0,0]

model = hmm.DiscreteHiddenMarkovModel(A, B, initial_position, statements)
︡8e3d8e24-db05-43d1-9760-c4d039fe35b7︡
︠191c007b-994b-4e19-abba-d59e5009baa9︠
model
︡f366d967-9c55-46b5-bf4b-8e06c4b540ab︡{"stdout":"Discrete Hidden Markov Model with 4 States and 5 Emissions\nTransition matrix:\n[0.95 0.05  0.0  0.0]\n[ 0.0  0.6  0.4  0.0]\n[ 0.0  0.0 0.75 0.25]\n[0.15  0.0 0.05  0.8]\nEmission matrix:\n[0.05  0.0  0.0 0.95  0.0]\n[ 0.6  0.4  0.0  0.0  0.0]\n[ 0.0  1.0  0.0  0.0  0.0]\n[ 0.0 0.05  0.8  0.0 0.15]\nInitial probabilities: [1.0000, 0.0000, 0.0000, 0.0000]\nEmission symbols: ['I am hungry', 'Time to work', 'I am back home', '*asleep*', 'I am tired']\n"}︡
︠2d11ee3b-d8a8-4d46-81d0-a4bd8a47f555︠
set_random_seed(0); v,w = model.generate_sequence(50)
for z in zip(v,w):
    print z
︡ef68e329-a29f-4c24-a714-38fcc25a3b35︡{"stdout":"('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('Time to work', 1)\n('I am hungry', 1)\n('Time to work', 2)\n('I am back home', 3)\n('I am back home', 3)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n('*asleep*', 0)\n"}︡
︠69c19cc9-558e-4304-8545-5bb2d0349055︠
model.viterbi(['*asleep*', 'I am hungry', 'Time to work', 'I am back home', 'Time to work', 'I am back home', 'I am tired', '*asleep*', '*asleep*', 'I am hungry'])
︡150ffa73-2d87-40da-b536-2f724990aaa9︡{"stdout":"([0, 1, 2, 3, 3, 3, 3, 0, 0, 0], -16.96703173570257)\n"}︡
︠2fc68a4e-3757-4b8e-a398-123c812b152f︠

