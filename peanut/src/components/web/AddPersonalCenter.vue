<template>
    <div>
          <Menu />
        <PersonalContent/>
          <Bottom />
    </div>
</template>

<script>

import PersonalContent from './PersonalContent'
import Menu from "./Menu";
import Bottom from "./Bottom";


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