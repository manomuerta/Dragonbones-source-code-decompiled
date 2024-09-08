package _12491
{
   import _1033._12916;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _12465._12467;
   import _12908._12909;
   import _12908._12910;
   import _1529._1528;
   import _1529._1530;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   
   public class _12495 extends _12499
   {
      protected static const mainTitleBgRes:Class = _12495_mainTitleBgRes;
      
      public function _12495()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc5_:Label = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         super._2438();
         _loc1_ = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 195;
         _loc1_.addElement(new _1105(mainTitleBgRes));
         var _loc2_:Group = _125._2413();
         _loc2_.left = _loc2_.right = _loc2_.bottom = 10;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            _loc2_.setStyle("fontFamily","微软雅黑");
         }
         var _loc3_:Group = new Group();
         var _loc4_:Label;
         (_loc4_ = _125._12836(String(cloudPayModel._13023))).fontFamily = "Arial";
         _loc4_.size = 60;
         _loc4_.textColor = 16772241;
         _loc4_.bottom = -10;
         _loc3_.addElement(_loc4_);
         (_loc4_ = _125._12836(tr("Pay.day.after"))).bottom = 0;
         _loc4_.left = 80;
         _loc3_.addElement(_loc4_);
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(_125._12836(tr("Pay.function.ban")));
         _loc1_.addElement(_loc2_);
         _2527.addElement(_loc1_);
         _2512.addElement(new _12909(tr("Pay.title")));
         (_loc5_ = new Label()).percentWidth = 100;
         _loc5_.htmlText = tr("Pay.desc",cloudPayModel._13953());
         _2512.addElement(_loc5_);
         var _loc6_:_12910 = new _12910(_12916);
         _loc6_.setStyle("size",13);
         _2512.addElement(_loc6_);
         (_loc5_ = new Label()).percentWidth = 100;
         _loc5_.htmlText = tr("Pay.desc2",_12467._12721 * 12);
         _2512.addElement(_loc5_);
         _loc2_ = _125._2413(4);
         _loc7_ = 0;
         _loc8_ = int(cloudPayModel.items.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_.addElement(this._12765(cloudPayModel.items[_loc7_].name,tr("Pay.money.unit",cloudPayModel.items[_loc7_].price),cloudPayModel.items[_loc7_].desc,cloudPayModel.items[_loc7_].limit));
            _loc7_++;
         }
         _2512.addElement(_loc2_);
         _12878(tr("Pay.notice.later"),tr("Pay.buy.now"));
      }
      
      private function _12765(param1:String, param2:String, param3:String, param4:int) : Group
      {
         var _loc5_:Group;
         (_loc5_ = _125._2414(0)).percentWidth = 100;
         var _loc6_:Label;
         (_loc6_ = new Label()).text = param1;
         _loc5_.addElement(_loc6_);
         (_loc6_ = new Label()).text = param2;
         _loc6_.bold = true;
         _loc5_.addElement(_loc6_);
         (_loc6_ = new Label()).text = param3;
         _loc5_.addElement(_loc6_);
         (_loc6_ = new Label()).size = 13;
         _loc6_.text = param4 == 0 ? tr("Pay.limit.no") : tr("Pay.limit.num",param4);
         _loc5_.addElement(_loc6_);
         return _loc5_;
      }
   }
}

