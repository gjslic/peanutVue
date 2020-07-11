<template>
    <div>
        <Menu />
        <PersonalContent/>
        <Bottom />
    </div>
</template>

<script>

import Menu from '../web/Menu'
import PersonalContent from './PersonalContent'
import Bottom from '../web/Bottom'


export default {
    name: 'AddPersonalCenter',
    components: {
        Menu,
        PersonalContent,
        Bottom
    }
}
</script>

<style>

</style>