<script setup>
import { ref } from "vue";
import { useI18n } from 'vue-i18n'

const { t } = useI18n();

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
        .showMessageBox(t('pages.game.dialogs.startNewGameTitle'),
            t('pages.game.dialogs.startNewGameMessage'),
            'YES_NO', 'QUESTION');
    if (button == 'YES') {
        doStartNewGame();
    }
}
</script>

<template>
    <div class="box-border w-full h-full flex flex-col justify-center items-center">
        <div class="flex flex-row justify-around items-center shadow-lg bg-gray-300 p-2">
            <img src="@/assets/vectors/start.svg" :alt="t('pages.game.buttons.startGameAlt')" class="w-10 h-10 mx-2"
                @click="purposeStartGame" />
            <img src="@/assets/vectors/reverse.svg" :alt="t('pages.game.buttons.reverseBoardAlt')"
                class="w-10 h-10 mx-2" @click="toggleBoardReversed" />
        </div>
        <loloof64-chessboard ref="board" size="450" :reversed="boardReversed" class="pt-6" />
    </div>
</template>