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
        PersonalContent
    }
}
</script>

<style>

</style>