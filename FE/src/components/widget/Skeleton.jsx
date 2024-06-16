import Skeleton from 'react-loading-skeleton'
import 'react-loading-skeleton/dist/skeleton.css'
const SkeletonCustom = ({ lines }) => {
    return (<>
        <Skeleton count={lines} />
    </>);
}

export default SkeletonCustom;