package _12491
{
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _127._171;
   import _12908._12910;
   import _1374.DropDownList;
   import _1374.TextInput;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _636.PayEvent;
   import _648._12463;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _12913 extends _171
   {
      private var _13053:TextInput;
      
      private var _13049:TextInput;
      
      private var _13052:TextInput;
      
      private var _13050:TextInput;
      
      private var dropDownList:DropDownList;
      
      private var _12762:TextInput;
      
      private var btn:Button;
      
      public function _12913()
      {
         this.userModel = _1407.getInstance(_12463);
         super();
         this.title = tr("Pay.company.title");
         this.width = 500;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Label = null;
         super._2438();
         closeButton.visible = true;
         _2512.top = _2512.bottom = 10;
         _2512.left = 15;
         _2512.right = 25;
         _loc1_ = _125._12836(tr("Pay.company.desc"));
         _loc1_.height = 40;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            _loc1_.fontFamily = "微软雅黑";
         }
         _loc1_.size = 16;
         _loc1_.percentWidth = 100;
         _loc1_.textAlign = "center";
         _2512.addElement(_loc1_);
         this._12762 = this._12765(tr("Pay.company.mail"),this.userModel.mail);
         this._12762.enabled = false;
         this._12762.editable = false;
         this._13053 = this._12765(tr("Pay.company.name"));
         this._13049 = this._12765(tr("Pay.company.company"));
         this._13052 = this._12765(tr("Pay.company.position"));
         this._13050 = this._12765(tr("Pay.company.contact"));
         this.dropDownList = new DropDownList();
         this.dropDownList.width = 100;
         this.dropDownList.dataProvider = new _1037([tr("Pay.company.qq"),tr("Pay.company.wechat"),tr("Pay.company.skype")]);
         this.dropDownList.selectedIndex = 0;
         (this._13050.parent as Group).addElementAt(this.dropDownList,1);
         (this._13050.parent as Group).height = 25;
         var _loc2_:Group = new Group();
         _loc2_.percentWidth = 100;
         _loc2_.height = 30;
         var _loc3_:Button = new _12910(null,true);
         _loc3_.horizontalCenter = 0;
         _loc3_.bottom = 0;
         _loc2_.addElement(_loc3_);
         _2512.addElement(_loc2_);
         var _loc4_:Group = _125._12511();
         this.btn = _125._12513(tr("Pay.company.apply"));
         this.btn.width = 150;
         this.btn.height = 30;
         this.btn.addEventListener(MouseEvent.CLICK,this._3753);
         _loc4_.addElement(this.btn);
         this._13053.addEventListener(Event.CHANGE,this._13051);
         this._13049.addEventListener(Event.CHANGE,this._13051);
         this._12762.addEventListener(Event.CHANGE,this._13051);
         this._13052.addEventListener(Event.CHANGE,this._13051);
         this._13050.addEventListener(Event.CHANGE,this._13051);
         _2512.addElement(_loc4_);
         this._13051(null);
      }
      
      private function _13051(param1:Event) : void
      {
         this.btn.enabled = this._13053.text != null && this._13053.text != "" && this._13049.text != null && this._13049.text != "" && this._12762.text != null && this._12762.text != "" && this._13052.text != null && this._13052.text != "" && this._13050.text != null && this._13050.text != "";
      }
      
      private function _12765(param1:String, param2:String = "") : TextInput
      {
         var _loc3_:Group = _125._2414(10);
         _loc3_.percentWidth = 100;
         _loc3_.addElement(this._12836(param1));
         var _loc4_:TextInput;
         (_loc4_ = new TextInput()).percentWidth = 100;
         _loc4_.text = param2;
         _loc3_.addElement(_loc4_);
         _2512.addElement(_loc3_);
         return _loc4_;
      }
      
      private function _12836(param1:String) : Label
      {
         var _loc2_:Label = _125._12836(param1);
         _loc2_.width = 80;
         _loc2_.textAlign = "right";
         return _loc2_;
      }
      
      private function _3753(param1:MouseEvent) : void
      {
         var _loc2_:Object = {};
         _loc2_.email = this.userModel.mail;
         _loc2_.name = this._13053.text;
         _loc2_.company = this._13049.text;
         _loc2_.title = this._13052.text;
         _loc2_.contact = String(this.dropDownList._2484) + ": " + this._13050.text;
         dispatchEvent(new PayEvent(PayEvent.APPLY_ENTERPRISE,JSON.stringify(_loc2_)));
      }
      
      override public function close() : void
      {
         this._13053.removeEventListener(Event.CHANGE,this._13051);
         this._13049.removeEventListener(Event.CHANGE,this._13051);
         this._12762.removeEventListener(Event.CHANGE,this._13051);
         this._13052.removeEventListener(Event.CHANGE,this._13051);
         this._13050.removeEventListener(Event.CHANGE,this._13051);
         super.close();
      }
   }
}

