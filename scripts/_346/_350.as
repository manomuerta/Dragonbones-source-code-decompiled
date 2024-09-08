package _346
{
   import _1404._1407;
   import _477.ExportEgretController;
   import _579._580;
   import _721._720;
   import _93._92;
   import _953._960;
   import _97._117;
   import _97._118;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _350 extends _92
   {
      private var projectPath:String;
      
      public function _350()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.projectPath = this.ouputPath;
         this._2372();
      }
      
      private function _2372() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["release/index.html","release/main.min.js","release/libs/qrcode.js","release/libs/modules/egret/egret.min.js","release/libs/modules/egret/egret.web.min.js","release/libs/modules/game/game.min.js","release/libs/modules/game/game.web.min.js","release/libs/modules/res/res.min.js","release/libs/modules/tween/tween.min.js","release/resource/resource.json"];
         var _loc6_:File = new File(this.projectPath);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc5_[_loc7_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc5_[_loc7_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc4_ = _loc6_.resolvePath(_loc5_[_loc7_]).nativePath;
            FileUtil.save(_loc4_,_loc3_);
            _loc7_++;
         }
         this._3232();
      }
      
      private function _3232() : void
      {
         var _loc1_:_960 = this._3176.stagePanel.stageView;
         var _loc2_:File = File.applicationDirectory.resolvePath("egretlauncher/release/index.html");
         if(!_loc2_.exists)
         {
            _loc2_ = File.applicationDirectory;
            _loc2_ = new File(FileUtil.getDirectory(_loc2_.nativePath));
            _loc2_ = _loc2_.resolvePath("doc").resolvePath("egretlauncher/release/index.html");
         }
         var _loc3_:String = FileUtil.openAsString(_loc2_.nativePath);
         _loc3_ = _loc3_.split("<h1>点击屏幕切换角色动作</h1>").join("");
         if(this.screenMate != "noScale")
         {
            _loc3_ = _loc3_.split("width: 100%;height: 100%").join("width:100%;height:100%");
         }
         else
         {
            _loc3_ = _loc3_.split("width: 100%;height: 100%").join("width:" + _loc1_._3233 + "px;height:" + _loc1_._3231 + "px");
         }
         _loc3_ = _loc3_.split("data-content-width=\"1200\"").join("data-content-width=\"" + _loc1_._3233 + "\"");
         _loc3_ = _loc3_.split("data-content-height=\"900\"").join("data-content-height=\"" + _loc1_._3231 + "\"");
         _loc3_ = _loc3_.split("data-frame-rate=\"30\"").join("data-frame-rate=\"" + this.fps + "\"");
         _loc3_ = _loc3_.split("data-scale-mode=\"showAll\"").join("data-scale-mode=\"" + this.screenMate + "\"");
         _loc3_ = _loc3_.split("data-orientation=\"auto\"").join("data-orientation=\"" + this._3241 + "\"");
         var _loc4_:File = new File(this.projectPath);
         _118.save(_loc4_.resolvePath("release/index.html").nativePath,_loc3_,true,"",false,this._2378,this._2379);
      }
      
      private function _2378() : void
      {
         this._3228.startExport(this._3238);
      }
      
      private function _2379() : void
      {
         _117._2377("ExportEgret, Export file error");
      }
      
      private function get ouputPath() : String
      {
         return _2223._3238.ouputPath as String;
      }
      
      private function get _3238() : _720
      {
         return _2223._3238 as _720;
      }
      
      private function get screenMate() : String
      {
         return _2223.screenMate as String;
      }
      
      private function get _3241() : String
      {
         return _2223._3241 as String;
      }
      
      private function get showFps() : String
      {
         return _2223.showFps as String;
      }
      
      private function get fps() : String
      {
         return _2223.fps as String;
      }
      
      private function get _3228() : ExportEgretController
      {
         return _1407.getInstance(ExportEgretController) as ExportEgretController;
      }
      
      public function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

