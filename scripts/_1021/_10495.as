package _1021
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1185._1197;
   import _1315._1318;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _10495 extends Group
   {
      public var _7134:_1105;
      
      public var _6548:Label;
      
      public var _7137:Label;
      
      public var _7136:Label;
      
      public var _7135:Label;
      
      private var _7133:_1318;
      
      private var _7132:int = 100;
      
      private var _7131:int = 100;
      
      public function _10495()
      {
         this._7134 = new _1105();
         this._6548 = new Label();
         this._7137 = new Label();
         this._7136 = new Label();
         this._7135 = new Label();
         super();
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 6;
         this.percentWidth = 100;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6548._6541 = true;
         this._7137._6541 = true;
         this._7136._6541 = true;
         this._7135._6541 = true;
         this._6548.percentWidth = 100;
         this._7137.percentWidth = 100;
         this._7136.percentWidth = 100;
         this._7135.percentWidth = 100;
         addElement(this._7134);
         var _loc1_:Group = _125._2413();
         _loc1_.addElement(this._6548);
         _loc1_.addElement(this._7137);
         _loc1_.addElement(this._7136);
         _loc1_.addElement(this._7135);
      }
      
      public function setData(param1:*, param2:File = null) : void
      {
         var _loc3_:File = null;
         var _loc4_:ByteArray = null;
         var _loc5_:Date = null;
         if(param1 is File)
         {
            _loc3_ = param1 as File;
         }
         else
         {
            _loc4_ = param1 as ByteArray;
            _loc3_ = param2;
         }
         this._6548.text = _loc3_.name;
         this._7137.text = _loc3_.nativePath;
         if(param2 != null)
         {
            _loc5_ = new Date();
            this._7136.text = tr("Import.file.size",Number(_loc4_.length / 1000).toFixed(2));
         }
         else
         {
            _loc5_ = _loc3_.modificationDate;
            this._7136.text = tr("Import.file.size",Number(_loc3_.size / 1000).toFixed(2));
         }
         this._7135.text = tr("Import.file.date",_loc5_.fullYear,_loc5_.month,_loc5_.day);
         if(_loc3_.extension.toLowerCase() == "png" || _loc3_.extension.toLowerCase() == "jpg" || _loc3_.extension.toLowerCase() == "jpeg")
         {
            if(this._7133 == null)
            {
               this._7133 = new _1318();
            }
            if(_loc4_ == null)
            {
               _loc4_ = FileUtil.openAsByteArray(_loc3_.nativePath);
            }
            this._7133.decode(_loc4_,this.onComplete);
         }
         else
         {
            this._7134.source = null;
            this._7134.width = this._7132;
            this._7134.height = this._7131;
         }
      }
      
      private function onComplete(param1:BitmapData) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1)
         {
            _loc3_ = this._7132 / param1.width;
            _loc4_ = this._7131 / param1.height;
            _loc2_ = _loc3_ < _loc4_ ? _loc3_ : _loc4_;
            if(_loc2_ > 1)
            {
               _loc2_ = 1;
            }
            this._7134.source = param1;
            this._7134.scaleX = this._7134.scaleY = _loc2_;
            this._7134.x = (this._7132 - param1.width * _loc2_) * 0.5;
            this._7134.y = (this._7131 - param1.height * _loc2_) * 0.5;
         }
      }
      
      public function set _10515(param1:int) : void
      {
         this._7132 = param1;
      }
      
      public function set _10514(param1:int) : void
      {
         this._7131 = param1;
      }
   }
}

