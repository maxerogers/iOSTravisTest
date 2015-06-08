#import <Specta/Specta.h>
#import <Expecta.h>

SpecBegin(TestTemplate)
describe(@"TestTemplate", ^{
    it(@"TestTemplate", ^{
        expect(@"foo").to.equal(@"foo");
    });
});

SpecEnd