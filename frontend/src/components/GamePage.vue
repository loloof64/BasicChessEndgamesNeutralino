<script setup>
import {ref} from "vue";

const board = ref();

function doStartNewGame() {
    board.value.newGame();
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
                class="w-10 h-10"
                @click="purposeStartGame"
            />
        </div>
        <loloof64-chessboard
            ref="board"
            size="450"
            class="pt-6"
        />
    </div>
</template>