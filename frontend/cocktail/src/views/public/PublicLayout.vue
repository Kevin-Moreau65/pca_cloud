<template>
    <div>
        <PublicNav/>
        <router-view/>
    </div>
</template>

<script>
import PublicNav from '@/components/PublicNav.vue'

export default {
    name: 'PublicLayout',
    components:{
        PublicNav
    }
}
</script>