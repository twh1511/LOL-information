#import "LOLNewsListCell.h"

@implementation LOLNewsListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.font=[UIFont systemFontOfSize:12];
        _timeLb.textColor=[UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.detailLb.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.detailLb.mas_rightMargin);
            make.right.mas_equalTo(-10);
            make.bottom.mas_offset(-10);
        }];
    }
    return _timeLb;
}

- (UILabel *)detailLb {
    if(_detailLb == nil) {
        _detailLb = [[UILabel alloc] init];
        [self.contentView addSubview:_detailLb];
        _detailLb.font=[UIFont systemFontOfSize:16];
        _detailLb.textColor=[UIColor lightGrayColor];
        
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
    }
    return _detailLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font=[UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.leftImageView.mas_topMargin);
        }];
    }
    return _titleLb;
}

- (UIImageView *)leftImageView {
    if(_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(80, 60));
        }];
    }
    return _leftImageView;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**选中cell时的风格*/
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
