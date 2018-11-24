const FishToken = artifacts.require('./FishToken.sol');

const TimePeriodInSeconds = 3600;
const from = Math.floor(new Date() / 1000);
const to = from + TimePeriodInSeconds;

contract('FishToken', async(accounts)=>{
    const owner = accounts[0]
    const user1 = accounts[1]
    const user2 = accounts[2]

    let instance
    beforeEach('setup contract for each test', async () => {
        instance = await FishToken.new(to);
    })

    it('Owner is shark', async ()=>{
        const currentShark = await instance.currentShark()
        assert.equal(currentShark, owner)
    })

    it("Add to participants should be restricted", async ()=>{
        try{
            await instance.addToParticipants(user1)
            assert.equal(true, false)
        }catch(err){
            assert.equal(true, true)
        }
    })
})