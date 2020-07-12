@tlh报表管理
<template>
    <div>
        <EchartsUser/>
        <EchartsPie/>
        <EchartsSale/>
    </div>
</template>

<script>
    import EchartsUser from "./EchartsUser";
    import EchartsSale from "./EchartsSale";
    import EchartsPie from "./EchartsPie";
    export default {
        name: "AdminEcharts",
        components: {
            EchartsUser,
            EchartsPie,
            EchartsSale
        }
    };
</script>

<style scoped>
</style>