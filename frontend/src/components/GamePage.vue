<script setup>
import {ref} from "vue";

const board = ref();
const boardReversed = ref(false);

function doStartNewGame() {
    board.value.newGame();
}

function toggleBoardReversed() {
    boardReversed.value = !boardReversed.value;
}

async function purposeStartGame() {
    let button = await Neutralino.os
            .showMessageBox('Start a new game ?',
                            'Do you want to start a new game ?',
                            'YES_NO', 'QUESTION');
    if(button == 'YES') {
        doStartNewGame();
    }
}
</script>

<template>
    <div class="box-border w-full h-full flex flex-col justify-center items-center">
         <div class="flex flex-row justify-around items-center shadow-lg bg-gray-300 p-2">
            <img src="@/assets/vectors/start.svg" alt="start game"
                class="w-10 h-10 mx-2"
                @click="purposeStartGame"
            />
            <img src="@/assets/vectors/reverse.svg" alt="reverse board"
                class="w-10 h-10 mx-2"
                @click="toggleBoardReversed"
            />
        </div>
        <loloof64-chessboard
            ref="board"
            size="450"
            :reversed="boardReversed"
            class="pt-6"
        />
    </div>
</template>