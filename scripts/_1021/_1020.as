package _1021
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _12444.CopyImageFileTask;
   import _12444.CopyTextureFileTask;
   import _127._128;
   import _127._171;
   import _217._11844;
   import _354.AddImageFileTask;
   import _354.AddTextureFileTask;
   import _354._353;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _1020 extends _171
   {
      public static const TYPE_ARMATURE:int = 0;
      
      public static const TYPE_FILE:int = 1;
      
      public static const TYPE_TEXTURE:int = 2;
      
      public static const TYPE_ANIMATION:int = 3;
      
      public static const TYPE_COPY_IMAGE:int = 4;
      
      public static const TYPE_COPY_TEXTURE:int = 5;
      
      public var _7130:Label;
      
      public var radioGroup:_1081;
      
      public var radio1:RadioButton;
      
      public var radio2:RadioButton;
      
      public var radio3:RadioButton;
      
      public var tip1:Label;
      
      public var tip2:Label;
      
      public var tip3:Label;
      
      public var _7129:_128;
      
      public var _5554:Button;
      
      public var _7128:_1022;
      
      public var _7127:_1022;
      
      private var _callback:Function;
      
      private var _type:int;
      
      public function _1020()
      {
         this._7130 = new Label();
         this.radioGroup = new _1081();
         this.radio1 = new RadioButton();
         this.radio2 = new RadioButton();
         this.radio3 = new RadioButton();
         this.tip1 = new Label();
         this.tip2 = new Label();
         this.tip3 = new Label();
         this._7129 = new _128();
         this._7128 = new _1022();
         this._7127 = new _1022();
         super();
         this.title = tr("Import.curProject.title");
         this.width = NaN;
         if(SystemInfo.isMacOS)
         {
            resizable = false;
         }
         else
         {
            this.minWidth = 525;
            this.minHeight = 380;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7130.percentWidth = 100;
         this.radio1.group = this.radioGroup;
         this.radio2.group = this.radioGroup;
         this.radio3.group = this.radioGroup;
         var _loc1_:Group = _125._2414();
         var _loc2_:Label = new Label();
         _loc2_.width = 10;
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(this.tip1);
         var _loc3_:Group = _125._2414();
         var _loc4_:Label;
         (_loc4_ = new Label()).width = 10;
         _loc3_.addElement(_loc4_);
         _loc3_.addElement(this.tip2);
         var _loc5_:Group = _125._2414();
         var _loc6_:Label;
         (_loc6_ = new Label()).width = 10;
         _loc5_.addElement(_loc6_);
         _loc5_.addElement(this.tip3);
         var _loc7_:Group = _125._2414();
         var _loc8_:Label;
         (_loc8_ = new Label()).width = 10;
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._7128);
         var _loc9_:Group = _125._2414();
         var _loc10_:Label;
         (_loc10_ = new Label()).width = 10;
         _loc9_.addElement(_loc10_);
         _loc9_.addElement(this._7127);
         var _loc11_:Group;
         (_loc11_ = _125._2413(12)).percentWidth = 100;
         _loc11_.addElement(this._7130);
         _loc11_.addElement(this.radio1);
         _loc11_.addElement(_loc1_);
         _loc11_.addElement(this.radio2);
         _loc11_.addElement(_loc3_);
         _loc11_.addElement(_loc7_);
         _loc11_.addElement(this.radio3);
         _loc11_.addElement(_loc5_);
         _loc11_.addElement(_loc9_);
         _loc11_.addElement(this._7129);
         _2512.addElement(_loc11_);
         _2512.percentWidth = 100;
         this._5554 = _125._2399();
         _2632.addElement(this._5554);
         _2512.addElement(_2632);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._callback != null)
         {
            if(this._type == TYPE_ARMATURE)
            {
               if(this.radio1.selected)
               {
                  _loc2_ = _353.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = _353.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = _353.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  _353.type = _loc2_;
               }
            }
            else if(this._type == TYPE_TEXTURE)
            {
               if(this.radio1.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  AddTextureFileTask.type = _loc2_;
               }
            }
            else if(this._type == TYPE_ANIMATION)
            {
               if(this.radio1.selected)
               {
                  _loc2_ = _11844.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = _11844.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = _11844.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  _11844.type = _loc2_;
               }
            }
            else if(this._type == TYPE_COPY_IMAGE)
            {
               if(this.radio1.selected)
               {
                  _loc2_ = CopyImageFileTask.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = CopyImageFileTask.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = CopyImageFileTask.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  CopyImageFileTask.type = _loc2_;
               }
            }
            else if(this._type == TYPE_COPY_TEXTURE)
            {
               if(this.radio1.selected)
               {
                  _loc2_ = CopyTextureFileTask.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = CopyTextureFileTask.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = CopyTextureFileTask.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  CopyTextureFileTask.type = _loc2_;
               }
            }
            else
            {
               if(this.radio1.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_RENAME;
               }
               if(this.radio2.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_REPLACE;
               }
               if(this.radio3.selected)
               {
                  _loc2_ = AddImageFileTask.TYPE_ABANDON;
               }
               if(this._7129.selected)
               {
                  AddImageFileTask.type = _loc2_;
               }
            }
            this._callback(_loc2_);
         }
         close();
      }
      
      public function setData(param1:int, param2:String, param3:String, param4:String, param5:File, param6:ByteArray, param7:int, param8:Function) : void
      {
         this._type = param1;
         this._callback = param8;
         this.radio1.selected = true;
         this.radio2.selected = false;
         this.radio3.selected = false;
         switch(param1)
         {
            case TYPE_ARMATURE:
               this._7130.text = tr("Import.armature.conflict",param2);
               this.radio1.label = tr("Import.armature.saveAll");
               this.tip1.text = tr("Import.armature.saveAllTip",param3);
               this.radio2.label = tr("Import.armature.replace");
               this.tip2.text = tr("Import.armature.replaceTip");
               this.radio3.label = tr("Import.armature.discard");
               this.tip3.text = tr("Import.armature.discardTip");
               if(param7 > 0)
               {
                  this._7129.visible = true;
                  this._7129.label = tr("Import.curProject.batch",param7);
               }
               else
               {
                  this._7129.visible = false;
               }
               this._7128.visible = false;
               this._7128.includeInLayout = false;
               this._7127.visible = false;
               this._7127.includeInLayout = false;
               break;
            case TYPE_FILE:
            case TYPE_COPY_IMAGE:
               this._7130.text = tr("Import.file.conflict",param4,param2);
               this.radio1.label = tr("Import.file.saveAll");
               this.tip1.text = tr("Import.file.saveAllTip",param3);
               this.radio2.label = tr("Import.file.replace");
               this.tip2.text = tr("Import.file.replaceTip");
               this.radio3.label = tr("Import.file.discard");
               this.tip3.text = tr("Import.file.discardTip");
               if(param7 > 0)
               {
                  this._7129.visible = true;
                  this._7129.label = tr("Import.curProject.batch",param7);
               }
               else
               {
                  this._7129.visible = false;
               }
               this._7128.setData(param6,param5);
               this._7127.setData(param5);
               break;
            case TYPE_TEXTURE:
            case TYPE_COPY_TEXTURE:
               this._7130.text = tr("Import.texture.title",param4,param2);
               this.radio1.label = tr("Import.texture.saveAll");
               this.tip1.text = tr("Import.texture.saveAllTip",param3);
               this.radio2.label = tr("Import.texture.replace");
               this.tip2.text = tr("Import.texture.replaceTip");
               this.radio3.label = tr("Import.texture.discard");
               this.tip3.text = tr("Import.texture.discardTip");
               if(param7 > 0)
               {
                  this._7129.visible = true;
                  this._7129.label = tr("Import.curProject.batch",param7);
               }
               else
               {
                  this._7129.visible = false;
               }
               this._7128.setData(param6,param5);
               this._7127.setData(param5);
               break;
            case TYPE_ANIMATION:
               this._7130.text = tr("Import.animation.title",param2);
               this.radio1.label = tr("Import.animation.saveAll");
               this.tip1.text = tr("Import.animation.saveAllTip",param3);
               this.radio2.label = tr("Import.animation.replace");
               this.tip2.text = tr("Import.animation.replaceTip");
               this.radio3.label = tr("Import.animation.discard");
               this.tip3.text = tr("Import.animation.discardTip");
               if(param7 > 0)
               {
                  this._7129.visible = true;
                  this._7129.label = tr("Import.curProject.batch",param7);
               }
               else
               {
                  this._7129.visible = false;
               }
               this._7128.visible = false;
               this._7128.includeInLayout = false;
               this._7127.visible = false;
               this._7127.includeInLayout = false;
         }
      }
   }
}

