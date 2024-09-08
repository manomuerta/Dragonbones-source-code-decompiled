package _12491
{
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1105;
   import _12465._12467;
   import _12908._12907;
   import _12908._12909;
   import _12908._12911;
   import _1374.TextInput;
   import _1529._1528;
   import _1529._1530;
   import _834._12905;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _12497 extends _12499
   {
      protected static const mainTitleBgRes:Class = _12497_mainTitleBgRes;
      
      public static var _13012:Boolean = false;
      
      protected var _13039:Group;
      
      private var _12762:TextInput;
      
      public var radioGroup:_1081;
      
      private var _13043:_12907;
      
      public function _12497()
      {
         this.radioGroup = new _1081();
         this._13043 = new _12907();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc3_:Group = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         super._2438();
         this._13039 = new Group();
         this._13039.horizontalCenter = 0;
         this._13039.top = 285;
         this._13039.addElement(new _1105(mainTitleBgRes));
         var _loc1_:Label = _125._12836(tr("Pay.vip.pay"));
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            _loc1_.fontFamily = "微软雅黑";
         }
         _loc1_.horizontalCenter = _loc1_.verticalCenter = 0;
         this._13039.addElement(_loc1_);
         _2527.addElement(this._13039);
         _2512.addElement(new _12909(tr("Pay.main.title")));
         var _loc2_:Group = new Group();
         _loc2_.percentWidth = 100;
         _loc2_.addElement(new _12911(tr("Pay.price.year",_12467._12721 * 12)));
         _2512.addElement(_loc2_);
         _loc3_ = _125._2403();
         _loc3_.percentWidth = 100;
         _loc3_.addElement(_13041(tr("Pay.select"),80));
         var _loc4_:Group;
         (_loc4_ = _125._2413()).percentWidth = 100;
         _loc5_ = 0;
         _loc6_ = int(cloudPayModel.items.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_.addElement(this._12884(cloudPayModel.items[_loc5_]));
            _loc5_++;
         }
         _loc3_.addElement(_loc4_);
         _2512.addElement(_loc3_);
         _loc3_ = _125._2403();
         _loc3_.percentWidth = 100;
         _loc3_.addElement(_13041(tr("Pay.open.account"),80));
         (_loc4_ = _125._2413()).percentWidth = 100;
         var _loc7_:Group;
         (_loc7_ = _125._2403()).percentWidth = 100;
         this._12762 = new TextInput();
         this._12762.skinName = _12905;
         this._12762.percentWidth = 100;
         if(userModel._3766)
         {
            this._12762.text = userModel.mail;
            this._12762.enabled = false;
            this._12762.editable = false;
         }
         _loc7_.addElement(this._12762);
         _loc4_.addElement(_loc7_);
         this._13043.selected = true;
         this._13043.addEventListener(Event.CHANGE,this._6406);
         _loc4_.addElement(this._13043);
         _loc3_.addElement(_loc4_);
         _2512.addElement(_loc3_);
         _12878(tr("Pay.step.prev"),tr("Pay.step.next"));
         if(!_13012)
         {
            _10525.visible = _10525.includeInLayout = false;
         }
         this.radioGroup.addEventListener(Event.CHANGE,this._6406);
         this._6406(null);
      }
      
      private function _6406(param1:Event) : void
      {
         _10524.enabled = this.radioGroup.selection != null && this._13043.selected;
         _10524.getElementAt(0).alpha = _10524.getElementAt(1).alpha = _10524.enabled ? 1 : 0.5;
      }
      
      private function _12884(param1:_12467) : Group
      {
         var _loc5_:Label = null;
         var _loc2_:Group = _125._2414();
         var _loc3_:RadioButton = _12879(tr("Pay.money.unit",String(param1.price)),param1,this.radioGroup);
         _loc3_.width = 65;
         _loc3_.setStyle("bold",true);
         _loc2_.addElement(_loc3_);
         var _loc4_:Label;
         (_loc4_ = new Label()).text = tr("Pay.detail.1",param1.desc,param1._12723);
         _loc2_.addElement(_loc4_);
         if(param1.left != -1)
         {
            (_loc5_ = new Label()).size = 13;
            if(param1.left == 0)
            {
               _loc5_.text = tr("Pay.today.sellout");
               _loc3_.enabled = false;
               _loc2_.alpha = 0.6;
            }
            else
            {
               if(param1.left <= 5)
               {
                  _loc5_.text = tr("Pay.today.few");
                  _loc5_.textColor = 16711680;
               }
               else
               {
                  _loc5_.text = tr("Pay.today.some");
               }
               _loc2_.alpha = 1;
            }
            _loc2_.addElement(_loc5_);
         }
         return _loc2_;
      }
      
      private function _13044(param1:Event) : void
      {
      }
   }
}

