package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _127._128;
   import _127._171;
   import _1374.TextInput;
   import _1404._1407;
   import _625._633;
   import _721._762;
   import _97._118;
   import _97._124;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class _1029 extends _171
   {
      private static const _14765:int = 80;
      
      public var _7176:Label;
      
      public var _5535:TextInput;
      
      public var _7058:TextInput;
      
      public var _7292:Button;
      
      public var _7296:_128;
      
      public var _7291:Label;
      
      public var _7293:Label;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      private var _7299:_762;
      
      public function _1029(param1:_762)
      {
         super();
         this.title = tr("SaveAsProjectWindow.Title");
         this._7299 = param1;
      }
      
      override protected function _2438() : void
      {
         var _loc3_:Label = null;
         super._2438();
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         _2512.addElement(_loc1_);
         this._7176 = new Label();
         this._7176.text = tr("NewProjectWindow.ProjectName");
         this._5535 = new TextInput();
         this._5535.restrict = "^/\\:*?\"\'<>|.@#$%^&!~";
         this._5535.maxChars = 30;
         this._5535.addEventListener(Event.CHANGE,this._7253);
         this._5535.percentWidth = 100;
         _loc1_.addElement(this._7176);
         _loc1_.addElement(this._5535);
         var _loc2_:Group = _125._2414();
         _loc2_.percentWidth = 100;
         _2512.addElement(_loc2_);
         _loc3_ = new Label();
         _loc3_.text = tr("SaveAs.outputPath");
         this._7058 = new TextInput();
         this._7058.percentWidth = 100;
         this._7058.addEventListener(FocusEvent.FOCUS_OUT,this._7295);
         this._7292 = _125._2405();
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(this._7058);
         _loc2_.addElement(this._7292);
         var _loc4_:Group;
         (_loc4_ = _125._2414()).percentWidth = 100;
         _2512.addElement(_loc4_);
         this._7296 = new _128();
         this._7296.label = tr("Copy.Library");
         _loc4_.addElement(this._7296);
         this._7296.selected = false;
         this._7296.addEventListener(Event.CHANGE,this._6562);
         this._7291 = new Label();
         this._7291.percentWidth = 100;
         this._7291.alpha = 0.5;
         this._7291.includeInLayout = false;
         _2512.addElement(this._7291);
         this._7293 = new Label();
         this._7293.percentWidth = 100;
         this._7293.alpha = 0.5;
         this._7293.includeInLayout = false;
         _2512.addElement(this._7293);
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         _2632.addElement(this._5554);
         _2632.addElement(this._5555);
         _2512.addElement(_2632);
         this._7292.addEventListener(MouseEvent.CLICK,this._7294);
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         this._5535.text = this._7299.projectName;
         this._7058.text = this._7299.ouputPath;
         var _loc5_:File = new File(this._7299.ouputPath).resolvePath("library");
         if(_loc5_.exists)
         {
            this._7296.selected = false;
         }
         else
         {
            this._7296.selected = true;
         }
         this._7299._5603 = this._7296.selected;
         this._7297();
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("SaveAsConfirm"));
         this._7058.text = this._7298(this._7058.text);
         this._7299.projectName = this._5535.text;
         this._7299.ouputPath = this._7058.text;
         this._7299._5603 = this._7296.selected;
         (_1407.getInstance(_633) as _633)._5602(this._7299);
         close();
      }
      
      private function _7294(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         FileUtil.browseForOpen(function(param1:File):void
         {
            if(!param1)
            {
               return;
            }
            _7058.text = _7298(FileUtil.escapeUrl(param1.nativePath));
            _7299.ouputPath = _7058.text;
            _7297(true);
         },3);
      }
      
      private function _6562(param1:Event) : void
      {
         this._7299._5603 = this._7296.selected;
         this._7297();
      }
      
      private function _7253(param1:Event) : void
      {
         this._5535.text = _124._2392(this._5535.text);
         this._7299.projectName = this._5535.text;
         this._7297();
      }
      
      private function _7295(param1:Event) : void
      {
         var _loc2_:String = null;
         if(_118._2381(this._7058.text))
         {
            _loc2_ = this._7298(this._7058.text);
            this._7299.ouputPath = _loc2_;
         }
         else
         {
            this._7058.text = this._7299.ouputPath;
         }
         this._7297(true);
      }
      
      private function _7297(param1:Boolean = false) : void
      {
         var _loc2_:File = new File(this._7299.ouputPath + this._7299.projectName + ".dbproj");
         if(_loc2_.exists)
         {
            this._7291.text = tr("ProjectName.repeat");
            this._7291.includeInLayout = true;
         }
         else
         {
            this._7291.text = "";
            this._7291.includeInLayout = false;
         }
         _loc2_ = new File(this._7299.ouputPath).resolvePath("library");
         if(param1)
         {
            if(_loc2_.exists)
            {
               this._7296.selected = false;
            }
            else
            {
               this._7296.selected = true;
            }
            this._7299._5603 = this._7296.selected;
         }
         if(this._7296.selected)
         {
            if(_loc2_.exists)
            {
               this._7293.text = tr("ProjectName.repeatLibrary");
               this._7293.includeInLayout = true;
            }
            else
            {
               this._7293.text = "";
               this._7293.includeInLayout = false;
            }
         }
         else if(_loc2_.exists)
         {
            this._7293.text = "";
            this._7293.includeInLayout = false;
         }
         else
         {
            this._7293.text = tr("ProjectName.projectLibNoShow");
            this._7293.includeInLayout = true;
         }
      }
      
      private function _7298(param1:String) : String
      {
         var _loc2_:* = param1;
         if(_loc2_.substr(_loc2_.length - 1,1) != "/")
         {
            _loc2_ += "/";
         }
         return _loc2_;
      }
   }
}

