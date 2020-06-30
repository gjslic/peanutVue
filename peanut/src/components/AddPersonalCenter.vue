<template>
    <div>
        <PersonalHead/>
        <PersonalContent/>
        <PersonalBottom/>
    </div>
</template>

<script>

import PersonalHead from './PersonalHead'

import PersonalContent from './PersonalContent'

import PersonalBottom from './PersonalBottom'

export default {
    name: 'AddPersonalCenter',
    components: {
        PersonalHead,
        PersonalContent,
        PersonalBottom
    }
}
</script>

<style>

</style>